# frozen_string_literal: true

module ParseHelper
  include AST::Sexp

  require 'parser/all'
  require 'parser/macruby'
  require 'parser/rubymotion'

  ALL_VERSIONS = %w(1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 mac ios)

  def setup
    @diagnostics = []

    super if defined?(super)
  end

  def parser_for_ruby_version(version)
    case version
    when '1.8' then parser = Parser::Ruby18.new
    when '1.9' then parser = Parser::Ruby19.new
    when '2.0' then parser = Parser::Ruby20.new
    when '2.1' then parser = Parser::Ruby21.new
    when '2.2' then parser = Parser::Ruby22.new
    when '2.3' then parser = Parser::Ruby23.new
    when '2.4' then parser = Parser::Ruby24.new
    when '2.5' then parser = Parser::Ruby25.new
    when '2.6' then parser = Parser::Ruby26.new
    when 'mac' then parser = Parser::MacRuby.new
    when 'ios' then parser = Parser::RubyMotion.new
    else raise "Unrecognized Ruby version #{version}"
    end

    parser.diagnostics.consumer = lambda do |diagnostic|
      @diagnostics << diagnostic
    end

    parser
  end

  def with_versions(versions)
    (versions & ALL_VERSIONS).each do |version|
      @diagnostics.clear

      parser = parser_for_ruby_version(version)
      yield version, parser
    end
  end

  def assert_source_range(begin_pos, end_pos, range, version, what)
    assert range.is_a?(Parser::Source::Range),
           "(#{version}) #{range.inspect}.is_a?(Source::Range) for #{what}"

    assert_equal begin_pos, range.begin_pos,
                 "(#{version}) begin of #{what}"

    assert_equal end_pos, range.end_pos,
                 "(#{version}) end of #{what}"
  end

  # Use like this:
  # ~~~
  # assert_parses(
  #   s(:send, s(:lit, 10), :+, s(:lit, 20))
  #   %q{10 + 20},
  #   %q{~~~~~~~ expression
  #     |   ^ operator
  #     |     ~~ expression (lit)
  #     },
  #     %w(1.8 1.9) # optional
  # )
  # ~~~
  def assert_parses(ast, code, source_maps='', versions=ALL_VERSIONS)
    with_versions(versions) do |version, parser|
      try_parsing(ast, code, parser, source_maps, version)
    end

    # Also try parsing with lexer set to use UTF-32LE internally
    with_versions(versions) do |version, parser|
      parser.instance_eval { @lexer.force_utf32 = true }
      try_parsing(ast, code, parser, source_maps, version)
    end
  end

  def try_parsing(ast, code, parser, source_maps, version)
    source_file = Parser::Source::Buffer.new('(assert_parses)')
    source_file.source = code

    begin
      parsed_ast = parser.parse(source_file)
    rescue => exc
      backtrace = exc.backtrace
      Exception.instance_method(:initialize).bind(exc).
        call("(#{version}) #{exc.message}")
      exc.set_backtrace(backtrace)
      raise
    end

    if ast.nil?
      assert_nil parsed_ast, "(#{version}) AST equality"
      return
    end

    assert_equal ast, parsed_ast,
                 "(#{version}) AST equality"

    parse_source_map_descriptions(source_maps) \
        do |begin_pos, end_pos, map_field, ast_path, line|

      astlet = traverse_ast(parsed_ast, ast_path)

      if astlet.nil?
        # This is a testsuite bug.
        raise "No entity with AST path #{ast_path} in #{parsed_ast.inspect}"
      end

      assert astlet.frozen?

      assert astlet.location.respond_to?(map_field),
             "(#{version}) #{astlet.location.inspect}.respond_to?(#{map_field.inspect}) for:\n#{parsed_ast.inspect}"

      range = astlet.location.send(map_field)

      assert_source_range(begin_pos, end_pos, range, version, line.inspect)
    end

    assert parser.instance_eval { @lexer }.cmdarg.empty?,
      "(#{version}) expected cmdarg to be empty after parsing"
  end

  # Use like this:
  # ~~~
  # assert_diagnoses(
  #   [:warning, :ambiguous_prefix, { prefix: '*' }],
  #   %q{foo *bar},
  #   %q{    ^ location
  #     |     ~~~ highlights (0)})
  # ~~~
  def assert_diagnoses(diagnostic, code, source_maps='', versions=ALL_VERSIONS)
    with_versions(versions) do |version, parser|
      source_file = Parser::Source::Buffer.new('(assert_diagnoses)')
      source_file.source = code

      begin
        parser = parser.parse(source_file)
      rescue Parser::SyntaxError
        # do nothing; the diagnostic was reported
      end

      assert_equal 1, @diagnostics.count,
                   "(#{version}) emits a single diagnostic, not\n" \
                   "#{@diagnostics.map(&:render).join("\n")}"

      emitted_diagnostic = @diagnostics.first

      level, reason, arguments = diagnostic
      arguments ||= {}
      message     = Parser::MESSAGES[reason] % arguments

      assert_equal level, emitted_diagnostic.level
      assert_equal reason, emitted_diagnostic.reason
      assert_equal arguments, emitted_diagnostic.arguments
      assert_equal message, emitted_diagnostic.message

      parse_source_map_descriptions(source_maps) \
          do |begin_pos, end_pos, map_field, ast_path, line|

        case map_field
        when 'location'
          assert_source_range begin_pos, end_pos,
                              emitted_diagnostic.location,
                              version, 'location'

        when 'highlights'
          index = ast_path.first.to_i

          assert_source_range begin_pos, end_pos,
                              emitted_diagnostic.highlights[index],
                              version, "#{index}th highlight"

        else
          raise "Unknown diagnostic range #{map_field}"
        end
      end
    end
  end

  # Use like this:
  # ~~~
  # assert_diagnoses_many(
  #   [
  #     [:warning, :ambiguous_literal],
  #     [:error, :unexpected_token, { :token => :tLCURLY }]
  #   ],
  #   %q{m /foo/ {}},
  #   SINCE_2_4)
  # ~~~
  def assert_diagnoses_many(diagnostics, code, versions=ALL_VERSIONS)
    with_versions(versions) do |version, parser|
      source_file = Parser::Source::Buffer.new('(assert_diagnoses_many)')
      source_file.source = code

      begin
        parser = parser.parse(source_file)
      rescue Parser::SyntaxError
        # do nothing; the diagnostic was reported
      end

      assert_equal diagnostics.count, @diagnostics.count

      diagnostics.zip(@diagnostics) do |expected_diagnostic, actual_diagnostic|
        level, reason, arguments = expected_diagnostic
        arguments ||= {}
        message     = Parser::MESSAGES[reason] % arguments

        assert_equal level, actual_diagnostic.level
        assert_equal reason, actual_diagnostic.reason
        assert_equal arguments, actual_diagnostic.arguments
        assert_equal message, actual_diagnostic.message
      end
    end
  end

  def refute_diagnoses(code, versions=ALL_VERSIONS)
    with_versions(versions) do |version, parser|
      source_file = Parser::Source::Buffer.new('(refute_diagnoses)')
      source_file.source = code

      begin
        parser = parser.parse(source_file)
      rescue Parser::SyntaxError
        # do nothing; the diagnostic was reported
      end

      assert_empty @diagnostics,
                   "(#{version}) emits no diagnostics, not\n" \
                   "#{@diagnostics.map(&:render).join("\n")}"
    end
  end

  def assert_context(context, code, versions=ALL_VERSIONS)
    with_versions(versions) do |version, parser|
      source_file = Parser::Source::Buffer.new('(assert_context)')
      source_file.source = code

      begin
        parser.parse(source_file)
      rescue Parser::SyntaxError
        # do nothing; the diagnostic was reported
      end

      assert_equal parser.context.stack, context, "(#{version}) parsing context"
    end
  end

  SOURCE_MAP_DESCRIPTION_RE =
      /(?x)
       ^(?# $1 skip)            ^(\s*)
        (?# $2 highlight)        ([~\^]+)
                                 \s+
        (?# $3 source_map_field) ([a-z_]+)
        (?# $5 ast_path)         (\s+\(([a-z_.\/0-9]+)\))?
                                $/

  def parse_source_map_descriptions(descriptions)
    unless block_given?
      return to_enum(:parse_source_map_descriptions, descriptions)
    end

    descriptions.each_line do |line|
      # Remove leading "     |", if it exists.
      line = line.sub(/^\s*\|/, '').rstrip

      next if line.empty?

      if (match = SOURCE_MAP_DESCRIPTION_RE.match(line))
        begin_pos        = match[1].length
        end_pos          = begin_pos + match[2].length
        source_map_field = match[3]

        if match[5]
          ast_path = match[5].split('.')
        else
          ast_path = []
        end

        yield begin_pos, end_pos, source_map_field, ast_path, line
      else
        raise "Cannot parse source map description line: #{line.inspect}."
      end
    end
  end

  def traverse_ast(ast, path)
    path.inject(ast) do |astlet, path_component|
      # Split "dstr/2" to :dstr and 1
      type_str, index_str = path_component.split('/')

      type  = type_str.to_sym

      if index_str.nil?
        index = 0
      else
        index = index_str.to_i - 1
      end

      matching_children = \
        astlet.children.select do |child|
          AST::Node === child && child.type == type
        end

      matching_children[index]
    end
  end
end
