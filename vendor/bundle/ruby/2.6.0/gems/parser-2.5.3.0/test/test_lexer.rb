# encoding: ascii-8bit
# frozen_string_literal: true

require 'helper'
require 'complex'

class TestLexer < Minitest::Test
  def setup_lexer(version)
    @lex = Parser::Lexer.new(version)

    @lex.comments = []
    @lex.diagnostics = Parser::Diagnostic::Engine.new
    @lex.diagnostics.all_errors_are_fatal = true
    # @lex.diagnostics.consumer = lambda { |diag| $stderr.puts "", diag.render }
  end

  def setup
    setup_lexer 18
  end

  #
  # Tools
  #

  def utf(str)
    str.dup.force_encoding(Encoding::UTF_8)
  end

  #
  # Additional matchers
  #

  def refute_scanned(s, *args)
    assert_raises Parser::SyntaxError do
      assert_scanned(s, *args)
    end
  end

  def assert_escape(expected, input)
    source_buffer = Parser::Source::Buffer.new('(assert_escape)')

    source_buffer.source = "\"\\#{input}\"".encode(input.encoding)

    @lex.reset
    @lex.source_buffer = source_buffer

    lex_token, (lex_value, *) = @lex.advance

    lex_value.force_encoding(Encoding::BINARY)

    assert_equal [:tSTRING, expected],
                 [lex_token, lex_value],
                 source_buffer.source
  end

  def refute_escape(input)
    err = assert_raises Parser::SyntaxError do
      @lex.state = :expr_beg
      assert_scanned "%Q[\\#{input}]"
    end
    assert_equal :fatal, err.diagnostic.level
  end

  def assert_lex_fname(name, type, range)
    begin_pos, end_pos = range
    assert_scanned("def #{name} ",
                   :kDEF, 'def', [0, 3],
                   type, name, [begin_pos + 4, end_pos + 4])

    assert_equal :expr_endfn, @lex.state
  end

  def assert_scanned(input, *args)
    source_buffer = Parser::Source::Buffer.new('(assert_scanned)')
    source_buffer.source = input

    @lex.reset(false)
    @lex.source_buffer = source_buffer

    until args.empty? do
      token, value, (begin_pos, end_pos) = args.shift(3)

      lex_token, (lex_value, lex_range) = @lex.advance
      assert lex_token, 'no more tokens'
      assert_operator [lex_token, lex_value], :eql?, [token, value], input
      assert_equal begin_pos, lex_range.begin_pos
      assert_equal end_pos, lex_range.end_pos
    end

    lex_token, (lex_value, *) = @lex.advance
    refute lex_token, "must be empty, but had #{[lex_token, lex_value].inspect}"
  end

  #
  # Tests
  #

  def test_read_escape
    assert_escape "\\",   "\\"
    assert_escape "\n",   "n"
    assert_escape "\t",   "t"
    assert_escape "\r",   "r"
    assert_escape "\f",   "f"
    assert_escape "\13",  "v"
    assert_escape "\0",   "0"
    assert_escape "\07",  "a"
    assert_escape "\007", "a"
    assert_escape "\033", "e"
    assert_escape "\377", "377"
    assert_escape "\377", "xff"
    assert_escape "\010", "b"
    assert_escape " ",    "s"
    assert_escape "q",    "q" # plain vanilla escape
  end

  def test_read_escape_c
    assert_escape "\030", "C-x"
    assert_escape "\030", "cx"
    assert_escape "\230", 'C-\M-x'
    assert_escape "\230", 'c\M-x'

    assert_escape "\177", "C-?"
    assert_escape "\177", "c?"
    assert_escape "\r",   "cM"
  end

  def test_read_escape_m
    assert_escape "\370", "M-x"
    assert_escape "\230", 'M-\C-x'
    assert_escape "\230", 'M-\cx'
  end

  def test_read_escape_errors
    refute_escape ""

    refute_escape "M"
    refute_escape "M-"
    refute_escape "Mx"

    refute_escape "Cx"
    refute_escape "C"
    refute_escape "C-"

    refute_escape "c"

    refute_escape "x"
  end

  def test_read_escape_unicode__19
    assert_escape "\x09", 'u{9}'
    assert_escape "\x31", 'u{31}'
    assert_escape "\x09\x01", 'u{9 1}'

    assert_escape "\xc4\xa3", utf('u0123')
    assert_escape "\xc4\xa3\xc3\xb0\xeb\x84\xa3", utf('u{123 f0 B123}')
  end

  def test_read_escape_unicode_bad__19
    refute_escape 'u123'
    refute_escape 'u{}'
    refute_escape 'u{123 f0h}'
    refute_escape 'u{123 f0'
  end

  def test_ambiguous_uminus
    assert_scanned("m -3",
                   :tIDENTIFIER, "m", [0, 1],
                   :tUNARY_NUM,  "-", [2, 3],
                   :tINTEGER,    3,   [3, 4])
  end

  def test_ambiguous_uplus
    assert_scanned("m +3",
                   :tIDENTIFIER, "m", [0, 1],
                   :tUNARY_NUM,  "+", [2, 3],
                   :tINTEGER,    3,   [3, 4])
  end

  def test_and
    assert_scanned "&", :tAMPER, "&", [0, 1]
  end

  def test_and2
    @lex.state = :expr_end

    assert_scanned "&&", :tANDOP, "&&", [0, 2]
  end

  def test_and2_equals
    @lex.state = :expr_end

    assert_scanned "&&=", :tOP_ASGN, "&&", [0, 3]
  end

  def test_and_arg
    @lex.state = :expr_arg

    assert_scanned(" &y",
                   :tAMPER,      "&", [1, 2],
                   :tIDENTIFIER, "y", [2, 3])
  end

  def test_and_equals
    @lex.state = :expr_end

    assert_scanned "&=", :tOP_ASGN, "&", [0, 2]
  end

  def test_and_expr
    @lex.state = :expr_arg

    assert_scanned("x & y",
                   :tIDENTIFIER, "x", [0, 1],
                   :tAMPER2,     "&", [2, 3],
                   :tIDENTIFIER, "y", [4, 5])
  end

  def test_and_meth
    assert_lex_fname "&", :tAMPER2, [0, 1]
  end

  def test_and_dot_arg
    @lex.state = :expr_arg

    assert_scanned "&.", :tANDDOT, "&.", [0, 2]
  end

  def test_and_dot_cmdarg
    @lex.state = :expr_cmdarg

    assert_scanned "&.", :tANDDOT, "&.", [0, 2]
  end

  def test_assoc
    assert_scanned "=>", :tASSOC, "=>", [0, 2]
  end

  def test_label__18
    assert_scanned("{a:b",
                   :tLBRACE,     "{", [0, 1],
                   :tIDENTIFIER, "a", [1, 2],
                   :tSYMBOL,     "b", [2, 4])
  end

  def test_label_in_params__18
    assert_scanned("foo(a:b",
                   :tIDENTIFIER, "foo", [0, 3],
                   :tLPAREN2,    "(",   [3, 4],
                   :tIDENTIFIER, "a",   [4, 5],
                   :tSYMBOL,     "b",   [5, 7])
  end

  def test_label__19
    setup_lexer 19

    assert_scanned("{a:b",
                   :tLBRACE,     "{", [0, 1],
                   :tLABEL,      "a", [1, 3],
                   :tIDENTIFIER, "b", [3, 4])
  end

  def test_label_in_params__19
    setup_lexer 19

    assert_scanned("foo(a:b",
                   :tIDENTIFIER, "foo", [0, 3],
                   :tLPAREN2,    "(",   [3, 4],
                   :tLABEL,      "a",   [4, 6],
                   :tIDENTIFIER, "b",   [6, 7])
  end

  def test_label_fid__19
    setup_lexer 19

    assert_scanned("{a?:true",
                   :tLBRACE, '{',    [0, 1],
                   :tLABEL,  'a?',   [1, 4],
                   :kTRUE,   'true', [4, 8])
  end

  def test_label__22
    setup_lexer 22

    assert_scanned("{'a':",
                   :tLBRACE,          '{', [0, 1],
                   :tSTRING_BEG,      "'", [1, 2],
                   :tSTRING_CONTENT,  'a', [2, 3],
                   :tLABEL_END,       "'", [3, 5])
  end

  def test_label_nested__22
    setup_lexer 22

    assert_scanned("{'a\":':",
                   :tLBRACE,          '{',   [0, 1],
                   :tSTRING_BEG,      "'",   [1, 2],
                   :tSTRING_CONTENT,  'a":', [2, 5],
                   :tLABEL_END,       "'",   [5, 7])
  end

  def test_label_colon2__22
    setup_lexer 22

    assert_scanned("{'a'::",
                   :tLBRACE, '{',  [0, 1],
                   :tSTRING, "a",  [1, 4],
                   :tCOLON2, '::', [4, 6])
  end

  def test_pct_string_colon__22
    setup_lexer 22

    assert_scanned("{%'a':",
                   :tLBRACE,         '{',  [0, 1],
                   :tSTRING_BEG,     "%'", [1, 3],
                   :tSTRING_CONTENT, 'a',  [3, 4],
                   :tSTRING_END,     "'",  [4, 5],
                   :tCOLON,          ':',  [5, 6])
  end

  def test_command_start__19
    setup_lexer 19

    %w[case elsif for in until when while
      if unless and or].each do |keyword|
      token = "k#{keyword.upcase}".to_sym

      @lex.reset
      assert_scanned("#{keyword} a:b",
                     token,        keyword, [0, keyword.length],
                     :tIDENTIFIER, "a", [keyword.length + 1, keyword.length + 2],
                     :tSYMBOL,     "b", [keyword.length + 2, keyword.length + 4])
    end
  end

  def test_mod_not_command_start__19
    setup_lexer 19

    %w[if unless while until rescue].each do |keyword|
      token = "k#{keyword.upcase}_MOD".to_sym

      @lex.state = :expr_end
      assert_scanned("#{keyword} a:b",
                     token,        keyword, [0, keyword.length],
                     :tLABEL,      "a", [keyword.length + 1, keyword.length + 3],
                     :tIDENTIFIER, "b", [keyword.length + 3, keyword.length + 4])
    end
  end

  def test_back_ref
    assert_scanned("[$&, $`, $', $+]",
                   :tLBRACK,   "[",  [0, 1],
                   :tBACK_REF, "$&", [1, 3],  :tCOMMA, ",", [3, 4],
                   :tBACK_REF, "$`", [5, 7],  :tCOMMA, ",", [7, 8],
                   :tBACK_REF, "$'", [9, 11], :tCOMMA, ",", [11, 12],
                   :tBACK_REF, "$+", [13, 15],
                   :tRBRACK,   "]",  [15, 16])
  end

  def test_backslash
    assert_scanned("1 \\\n+ 2",
                   :tINTEGER, 1,   [0, 1],
                   :tPLUS,    "+", [4, 5],
                   :tINTEGER, 2,   [6, 7])
  end

  def test_backslash_bad
    refute_scanned("1 \\ + 2",
                   :tINTEGER, 1, [0, 1])
  end

  def test_backtick
    assert_scanned("`ls`",
                   :tXSTRING_BEG,    "`",  [0, 1],
                   :tSTRING_CONTENT, "ls", [1, 3],
                   :tSTRING_END,     "`",  [3, 4])
  end

  def test_backtick_cmdarg
    @lex.state = :expr_dot
    assert_scanned("\n`", :tBACK_REF2, "`", [1, 2]) # \n ensures expr_cmd

    assert_equal :expr_arg, @lex.state
  end

  def test_backtick_dot
    @lex.state = :expr_dot
    assert_scanned("a.`(3)",
                   :tIDENTIFIER, "a", [0, 1],
                   :tDOT,        ".", [1, 2],
                   :tBACK_REF2,  "`", [2, 3],
                   :tLPAREN2,    "(", [3, 4],
                   :tINTEGER,    3,   [4, 5],
                   :tRPAREN,     ")", [5, 6])
  end

  def test_backtick_method
    @lex.state = :expr_fname
    assert_scanned("`", :tBACK_REF2, "`", [0, 1])
    assert_equal :expr_endfn, @lex.state
  end

  def test_bad_char
    refute_scanned(" \010 ")
  end

  def test_bang
    assert_scanned "!", :tBANG, "!", [0, 1]
  end

  def test_bang_equals
    assert_scanned "!=", :tNEQ, "!=", [0, 2]
  end

  def test_bang_tilde
    assert_scanned "!~", :tNMATCH, "!~", [0, 2]
  end

  def test_def_ubang
    setup_lexer(20)

    @lex.state = :expr_fname
    assert_scanned '!@', :tBANG, '!@', [0, 2]
  end

  def test_carat
    assert_scanned "^", :tCARET, "^", [0, 1]
  end

  def test_carat_equals
    assert_scanned "^=", :tOP_ASGN, "^", [0, 2]
  end

  def test_colon2
    assert_scanned("A::B",
                   :tCONSTANT, "A",  [0, 1],
                   :tCOLON2,   "::", [1, 3],
                   :tCONSTANT, "B",  [3, 4])

    @lex.state = :expr_arg
    assert_scanned("::Array",
                   :tCOLON2,   "::",    [0, 2],
                   :tCONSTANT, "Array", [2, 7])
  end

  def test_colon3
    assert_scanned("::Array",
                   :tCOLON3,   "::",    [0, 2],
                   :tCONSTANT, "Array", [2, 7])

    @lex.state = :expr_arg
    assert_scanned(" ::Array",
                   :tCOLON3,   "::",    [1, 3],
                   :tCONSTANT, "Array", [3, 8])
  end

  def test_comma
    assert_scanned ",", :tCOMMA, ",", [0, 1]
  end

  def test_comment
    assert_scanned("1 # one\n# two\n2",
                   :tINTEGER, 1,   [0, 1],
                   :tNL,      nil, [7, 8],
                   :tINTEGER, 2,   [14, 15])

    assert_equal 2, @lex.comments.length
    assert_equal '# one', @lex.comments[0].text
    assert_equal '# two', @lex.comments[1].text
  end

  def test_comment_expr_beg
    assert_scanned("{#1\n}",
                   :tLBRACE, "{", [0, 1],
                   :tRCURLY, "}", [4, 5])
  end

  def test_comment_begin
    assert_scanned("=begin\nblah\nblah\n=end\n42",
                   :tINTEGER, 42, [22, 24])
    assert_equal 1, @lex.comments.length
    assert_equal "=begin\nblah\nblah\n=end\n", @lex.comments[0].text
  end

  def test_comment_begin_bad
    refute_scanned("=begin\nblah\nblah\n")
  end

  def test_comment_begin_not_comment
    assert_scanned("beginfoo = 5\np x \\\n=beginfoo",
                   :tIDENTIFIER, "beginfoo", [0, 8],
                   :tEQL,        "=",        [9, 10],
                   :tINTEGER,    5,          [11, 12],
                   :tNL,         nil,        [12, 13],
                   :tIDENTIFIER, "p",        [13, 14],
                   :tIDENTIFIER, "x",        [15, 16],
                   :tEQL,        "=",        [19, 20],
                   :tIDENTIFIER, "beginfoo", [20, 28])
  end

  def test_comment_begin_space
    assert_scanned("=begin blah\nblah\n=end\n")

    assert_equal 1, @lex.comments.length
    assert_equal "=begin blah\nblah\n=end\n", @lex.comments[0].text
  end

  def test_comment_end_space_and_text
    assert_scanned("=begin blah\nblah\n=end blab\n")

    assert_equal 1, @lex.comments.length
    assert_equal "=begin blah\nblah\n=end blab\n", @lex.comments[0].text
  end

  def test_comment_eos
    assert_scanned("# comment")
  end

  def test_constant
    assert_scanned("ArgumentError",
                   :tCONSTANT, "ArgumentError", [0, 13])
  end

  def test_constant_semi
    assert_scanned("ArgumentError;",
                   :tCONSTANT, "ArgumentError", [0, 13],
                   :tSEMI,     ";",             [13, 14])
  end

  def test_cvar
    assert_scanned "@@blah", :tCVAR, "@@blah", [0, 6]
  end

  def test_cvar_bad
    refute_scanned "@@1"
  end

  def test_div
    assert_scanned("a / 2",
                   :tIDENTIFIER, "a", [0, 1],
                   :tDIVIDE,     "/", [2, 3],
                   :tINTEGER,    2,   [4, 5])
  end

  def test_div_equals
    assert_scanned("a /= 2",
                   :tIDENTIFIER, "a", [0, 1],
                   :tOP_ASGN,    "/", [2, 4],
                   :tINTEGER,    2,   [5, 6])
  end

  def test_do
    assert_scanned("x do 42 end",
                   :tIDENTIFIER, "x",   [0, 1],
                   :kDO,         "do",  [2, 4],
                   :tINTEGER,    42,    [5, 7],
                   :kEND,        "end", [8, 11])
  end

  def test_do_block
    @lex.state = :expr_endarg

    assert_scanned("do 42 end",
                   :kDO_BLOCK, "do",  [0, 2],
                   :tINTEGER,  42,    [3, 5],
                   :kEND,      "end", [6, 9])
  end

  def test_do_cond
    @lex.cond.push true

    assert_scanned("x do 42 end",
                   :tIDENTIFIER, "x",   [0, 1],
                   :kDO_COND,    "do",  [2, 4],
                   :tINTEGER,    42,    [5, 7],
                   :kEND,        "end", [8, 11])
  end

  def test_dot
    assert_scanned ".", :tDOT, ".", [0, 1]
  end

  def test_dot2
    assert_scanned "..", :tDOT2, "..", [0, 2]
  end

  def test_dot3
    assert_scanned "...", :tDOT3, "...", [0, 3]
  end

  def test_equals
    assert_scanned "=", :tEQL, "=", [0, 1]
  end

  def test_equals2
    assert_scanned "==", :tEQ, "==", [0, 2]
  end

  def test_equals3
    assert_scanned "===", :tEQQ, "===", [0, 3]
  end

  def test_equals_tilde
    assert_scanned "=~", :tMATCH, "=~", [0, 2]
  end

  def test_float
    assert_scanned "1.0", :tFLOAT, 1.0, [0, 3]
  end

  def test_float_bad_no_underscores
    refute_scanned "1__0.0"
  end

  def test_float_bad_no_zero_leading
    refute_scanned ".0"
  end

  def test_float_bad_trailing_underscore
    refute_scanned "123_.0"
  end

  def test_float_call
    assert_scanned("1.0.to_s",
                   :tFLOAT,      1.0,    [0, 3],
                   :tDOT,        ".",    [3, 4],
                   :tIDENTIFIER, "to_s", [4, 8])
  end

  def test_float_dot_E
    assert_scanned "1.0E10", :tFLOAT, 1.0e10, [0, 6]
  end

  def test_float_dot_E_neg
    assert_scanned("-1.0E10",
                   :tUNARY_NUM,  "-",    [0, 1],
                   :tFLOAT,      1.0e10, [1, 7])
  end

  def test_float_dot_E_pos
    assert_scanned("+1.0E10",
                   :tUNARY_NUM,  "+",    [0, 1],
                   :tFLOAT,      1.0e10, [1, 7])
  end

  def test_float_dot_e
    assert_scanned "1.0e10", :tFLOAT, 1.0e10, [0, 6]
  end

  def test_float_dot_e_neg
    assert_scanned("-1.0e10",
                   :tUNARY_NUM,  "-",    [0, 1],
                   :tFLOAT,      1.0e10, [1, 7])
  end

  def test_float_dot_e_pos
    assert_scanned("+1.0e10",
                   :tUNARY_NUM,  "+",    [0, 1],
                   :tFLOAT,      1.0e10, [1, 7])
  end

  def test_float_e
    assert_scanned "1e10", :tFLOAT, 1e10, [0, 4]
  end

  def test_float_e_bad_trailing_underscore
    refute_scanned "123_e10"
  end

  def test_float_e_minus
    assert_scanned "1e-10", :tFLOAT, 1e-10, [0, 5]
  end

  def test_float_e_neg
    assert_scanned("-1e10",
                   :tUNARY_NUM,  "-",  [0, 1],
                   :tFLOAT,      1e10, [1, 5])
  end

  def test_float_e_neg_minus
    assert_scanned("-1e-10",
                   :tUNARY_NUM,  "-",   [0, 1],
                   :tFLOAT,      1e-10, [1, 6])
  end

  def test_float_e_neg_plus
    assert_scanned("-1e+10",
                   :tUNARY_NUM,  "-",  [0, 1],
                   :tFLOAT,      1e10, [1, 6])
  end

  def test_float_e_pos
    assert_scanned("+1e10",
                   :tUNARY_NUM,  "+",  [0, 1],
                   :tFLOAT,      1e10, [1, 5])
  end

  def test_float_e_pos_minus
    assert_scanned("+1e-10",
                   :tUNARY_NUM,  "+",   [0, 1],
                   :tFLOAT,      1e-10, [1, 6])
  end

  def test_float_e_pos_plus
    assert_scanned("+1e+10",
                   :tUNARY_NUM,  "+",  [0, 1],
                   :tFLOAT,      1e10, [1, 6])
  end

  def test_float_e_plus
    assert_scanned "1e+10", :tFLOAT, 1e10, [0, 5]
  end

  def test_float_e_zero
    assert_scanned "0e0", :tFLOAT, 0e0, [0, 3]
  end

  def test_float_e_nothing
    [18, 19, 20].each do |version|
      setup_lexer version

      refute_scanned "1end"
      refute_scanned "1.1end"
    end

    setup_lexer 21

    assert_scanned("1end",
                   :tINTEGER, 1,     [0, 1],
                   :kEND,     'end', [1, 4])
    assert_scanned("1.1end",
                   :tFLOAT,   1.1,   [0, 3],
                   :kEND,     'end', [3, 6])
  end

  def test_float_neg
    assert_scanned("-1.0",
                   :tUNARY_NUM,  "-", [0, 1],
                   :tFLOAT,      1.0, [1, 4])
  end

  def test_float_pos
    assert_scanned("+1.0",
                   :tUNARY_NUM,  "+", [0, 1],
                   :tFLOAT,      1.0, [1, 4])
  end

  def test_ge
    assert_scanned("a >= 2",
                   :tIDENTIFIER, "a",  [0, 1],
                   :tGEQ,        ">=", [2, 4],
                   :tINTEGER,    2,    [5, 6])
  end

  def test_global
    assert_scanned("$blah", :tGVAR, "$blah", [0, 5])
  end

  def test_global_backref
    assert_scanned("$`", :tBACK_REF, "$`", [0, 2])
  end

  # This was removed in 2.1.
  # def test_global_dash_nothing
  #   assert_scanned("$- ", :tGVAR, "$-")
  # end

  def test_global_dash_something
    assert_scanned("$-x", :tGVAR, "$-x", [0, 3])
  end

  def test_global_number
    assert_scanned("$10", :tNTH_REF, 10, [0, 3])
  end

  def test_global_other
    assert_scanned("[$~, $*, $$, $?, $!, $@, $/, $\\, $;, $,, $., $=, $:, $<, $>, $\"]",
                   :tLBRACK, "[",   [0, 1],
                   :tGVAR,   "$~",  [1, 3],   :tCOMMA, ",", [3, 4],
                   :tGVAR,   "$*",  [5, 7],   :tCOMMA, ",", [7, 8],
                   :tGVAR,   "$$",  [9, 11],  :tCOMMA, ",", [11, 12],
                   :tGVAR,   "$\?", [13, 15], :tCOMMA, ",", [15, 16],
                   :tGVAR,   "$!",  [17, 19], :tCOMMA, ",", [19, 20],
                   :tGVAR,   "$@",  [21, 23], :tCOMMA, ",", [23, 24],
                   :tGVAR,   "$/",  [25, 27], :tCOMMA, ",", [27, 28],
                   :tGVAR,   "$\\", [29, 31], :tCOMMA, ",", [31, 32],
                   :tGVAR,   "$;",  [33, 35], :tCOMMA, ",", [35, 36],
                   :tGVAR,   "$,",  [37, 39], :tCOMMA, ",", [39, 40],
                   :tGVAR,   "$.",  [41, 43], :tCOMMA, ",", [43, 44],
                   :tGVAR,   "$=",  [45, 47], :tCOMMA, ",", [47, 48],
                   :tGVAR,   "$:",  [49, 51], :tCOMMA, ",", [51, 52],
                   :tGVAR,   "$<",  [53, 55], :tCOMMA, ",", [55, 56],
                   :tGVAR,   "$>",  [57, 59], :tCOMMA, ",", [59, 60],
                   :tGVAR,   "$\"", [61, 63],
                   :tRBRACK, "]",   [63, 64])
  end

  def test_global_underscore
    assert_scanned("$_",
                   :tGVAR, "$_", [0, 2])
  end

  def test_global_weird
    assert_scanned("$__blah",
                   :tGVAR, "$__blah", [0, 7])
  end

  def test_global_zero
    assert_scanned("$0", :tGVAR, "$0", [0, 2])
  end

  def test_gt
    assert_scanned("a > 2",
                   :tIDENTIFIER, "a", [0, 1],
                   :tGT,         ">", [2, 3],
                   :tINTEGER,    2,   [4, 5])
  end

  def test_heredoc_backtick
    assert_scanned("a = <<`EOF`\n  blah blah\nEOF\n",
                   :tIDENTIFIER,     "a",             [0, 1],
                   :tEQL,            "=",             [2, 3],
                   :tXSTRING_BEG,    "<<`",           [4, 11],
                   :tSTRING_CONTENT, "  blah blah\n", [12, 24],
                   :tSTRING_END,     "EOF",           [24, 27],
                   :tNL,             nil,             [11, 12])
  end

  def test_heredoc_double
    assert_scanned("a = <<\"EOF\"\n  blah blah\nEOF\n",
                   :tIDENTIFIER,     "a",             [0, 1],
                   :tEQL,            "=",             [2, 3],
                   :tSTRING_BEG,     "<<\"",          [4, 11],
                   :tSTRING_CONTENT, "  blah blah\n", [12, 24],
                   :tSTRING_END,     "EOF",           [24, 27],
                   :tNL,             nil,             [11, 12])
  end

  def test_heredoc_double_dash
    assert_scanned("a = <<-\"EOF\"\n  blah blah\n  EOF\n",
                   :tIDENTIFIER,     "a",             [0, 1],
                   :tEQL,            "=",             [2, 3],
                   :tSTRING_BEG,     "<<\"",          [4, 12],
                   :tSTRING_CONTENT, "  blah blah\n", [13, 25],
                   :tSTRING_END,     "EOF",           [25, 30],
                   :tNL,             nil,             [12, 13])
  end

  def test_heredoc_double_eos
    refute_scanned("a = <<\"EOF\"\nblah",
                   :tIDENTIFIER,     "a",    [0, 1],
                   :tEQL,            "=",    [2, 3],
                   :tSTRING_BEG,     "<<\"", [4, 7])
  end

  def test_heredoc_double_eos_nl
    refute_scanned("a = <<\"EOF\"\nblah\n",
                   :tIDENTIFIER,     "a",    [0, 1],
                   :tEQL,            "=",    [2, 3],
                   :tSTRING_BEG,     "<<\"", [4, 7])
  end

  def test_heredoc_double_interp
    assert_scanned("a = <<\"EOF\"\n#x a \#@a b \#$b c \#{3} \nEOF\n",
                   :tIDENTIFIER,     "a",     [0, 1],
                   :tEQL,            "=",     [2, 3],
                   :tSTRING_BEG,     "<<\"",  [4, 11],
                   :tSTRING_CONTENT, "#x a ", [12, 17],
                   :tSTRING_DVAR,    nil,     [17, 18],
                   :tIVAR,           "@a",    [18, 20],
                   :tSTRING_CONTENT, " b ",   [20, 23],
                   :tSTRING_DVAR,    nil,     [23, 24],
                   :tGVAR,           "$b",    [24, 26],
                   :tSTRING_CONTENT, " c ",   [26, 29],
                   :tSTRING_DBEG,    '#{',    [29, 31],
                   :tINTEGER,        3,       [31, 32],
                   :tRCURLY,         "}",     [32, 33],
                   :tSTRING_CONTENT, " \n",   [33, 35],
                   :tSTRING_END,     "EOF",   [35, 38],
                   :tNL,             nil,     [11, 12])
  end

  def test_heredoc_empty
    assert_scanned("<<\"\"\n\#{x}\nblah2\n\n",
                   :tSTRING_BEG,     "<<\"",    [0, 4],
                   :tSTRING_DBEG,    "\#{",     [5, 7],
                   :tIDENTIFIER,     "x",       [7, 8],
                   :tRCURLY,         "}",       [8, 9],
                   :tSTRING_CONTENT, "\n",      [9, 10],
                   :tSTRING_CONTENT, "blah2\n", [10, 16],
                   :tSTRING_END,     "",        [16, 16],
                   :tNL,             nil,       [4, 5])
  end

  def test_heredoc_none
    assert_scanned("a = <<EOF\nblah\nblah\nEOF",
                   :tIDENTIFIER,     "a",      [0, 1],
                   :tEQL,            "=",      [2, 3],
                   :tSTRING_BEG,     "<<\"",   [4, 9],
                   :tSTRING_CONTENT, "blah\n", [10, 15],
                   :tSTRING_CONTENT, "blah\n", [15, 20],
                   :tSTRING_END,     "EOF",    [20, 23],
                   :tNL,             nil,      [9, 10])
  end

  def test_heredoc_none_dash
    assert_scanned("a = <<-EOF\nblah\nblah\n  EOF",
                   :tIDENTIFIER,     "a",      [0, 1],
                   :tEQL,            "=",      [2, 3],
                   :tSTRING_BEG,     "<<\"",   [4, 10],
                   :tSTRING_CONTENT, "blah\n", [11, 16],
                   :tSTRING_CONTENT, "blah\n", [16, 21],
                   :tSTRING_END,     "EOF",    [21, 26],
                   :tNL,             nil,      [10, 11])
  end

  def test_heredoc_single
    assert_scanned("a = <<'EOF'\n  blah blah\nEOF\n",
                   :tIDENTIFIER,     "a",             [0, 1],
                   :tEQL,            "=",             [2, 3],
                   :tSTRING_BEG,     "<<'",           [4, 11],
                   :tSTRING_CONTENT, "  blah blah\n", [12, 24],
                   :tSTRING_END,     "EOF",           [24, 27],
                   :tNL,             nil,             [11, 12])
  end

  def test_heredoc_single_bad_eos_body
    refute_scanned("a = <<'EOF'\nblah",
                   :tIDENTIFIER,     "a", [0, 1],
                   :tEQL,            "=", [2, 3],
                   :tSTRING_BEG,     "'", [6, 7])
  end

  def test_heredoc_single_dash
    assert_scanned("a = <<-'EOF'\n  blah blah\n  EOF\n",
                   :tIDENTIFIER,     "a",             [0, 1],
                   :tEQL,            "=",             [2, 3],
                   :tSTRING_BEG,     "<<'",           [4, 12],
                   :tSTRING_CONTENT, "  blah blah\n", [13, 25],
                   :tSTRING_END,     "EOF",           [25, 30],
                   :tNL,             nil,             [12, 13])
  end

  def test_heredoc_one_character
    assert_scanned("a = <<E\nABCDEF\nE\n",
                   :tIDENTIFIER,     "a",        [0, 1],
                   :tEQL,            "=",        [2, 3],
                   :tSTRING_BEG,     "<<\"",     [4, 7],
                   :tSTRING_CONTENT, "ABCDEF\n", [8, 15],
                   :tSTRING_END,     "E",        [15, 16],
                   :tNL,             nil,        [7, 8])
  end

  def test_heredoc_cr
    assert_scanned("a = <<E\r\r\nABCDEF\r\r\nE\r\r\r\n",
                   :tIDENTIFIER,     "a",          [0, 1],
                   :tEQL,            "=",          [2, 3],
                   :tSTRING_BEG,     "<<\"",       [4, 7],
                   :tSTRING_CONTENT, "ABCDEF\r\n", [9, 17],
                   :tSTRING_END,     "E",          [17, 20],
                   :tNL,             nil,          [8, 9])
  end

  def test_heredoc_with_identifier_ending_newline__19
    setup_lexer 19
    refute_scanned "<<\"EOS\n\"\n123\nEOS\n"
  end

  def test_heredoc_with_identifier_ending_newline__24
    setup_lexer 24

    assert_scanned("a = <<\"EOS\n\"\nABCDEF\nEOS\n",
                   :tIDENTIFIER,     "a",          [0, 1],
                   :tEQL,            "=",          [2, 3],
                   :tSTRING_BEG,     "<<\"",       [4, 12],
                   :tSTRING_CONTENT, "ABCDEF\n",   [13, 20],
                   :tSTRING_END,     "EOS",        [20, 23],
                   :tNL,             nil,          [12, 13])
  end

  def test_heredoc_with_identifier_containing_newline_inside__19
    setup_lexer 19
    refute_scanned "<<\"EOS\nEOS\"\n123\nEOS\n"
  end

  def test_heredoc_with_identifier_containing_newline_inside__24
    setup_lexer 24

    refute_scanned "<<\"EOS\nEOS\"\n123\nEOS\n"
  end

  def test_identifier
    assert_scanned("identifier",
                   :tIDENTIFIER, "identifier", [0, 10])
  end

  def test_identifier_bang
    assert_scanned("identifier!",
                   :tFID,        "identifier!", [0, 11])

    assert_scanned("identifier!=",
                   :tIDENTIFIER, "identifier", [0, 10],
                   :tNEQ,        "!=",         [10, 12])
  end

  def test_identifier_eh
    setup_lexer 19

    assert_scanned("identifier?",
                   :tFID,        "identifier?", [0, 11])

    assert_scanned("identifier?=",
                   :tIDENTIFIER, "identifier", [0, 10],
                   :tCHARACTER,  "=",          [10, 12])
  end

  def test_identifier_cmp
    assert_lex_fname "<=>", :tCMP, [0, 3]
  end

  def test_identifier_def
    assert_lex_fname "identifier", :tIDENTIFIER, [0, 10]
  end

  def test_identifier_equals_arrow
    assert_scanned(":blah==>",
                   :tSYMBOL, "blah=", [0, 6],
                   :tASSOC, "=>",     [6, 8])
  end

  def test_identifier_equals3
    assert_scanned(":a===b",
                   :tSYMBOL,     "a",   [0, 2],
                   :tEQQ,        "===", [2, 5],
                   :tIDENTIFIER, "b",   [5, 6])
  end

  def test_identifier_equals_equals_arrow
    assert_scanned(":a==>b",
                   :tSYMBOL,     "a=", [0, 3],
                   :tASSOC,      "=>", [3, 5],
                   :tIDENTIFIER, "b",  [5, 6])
  end

  def test_identifier_equals_caret
    assert_lex_fname "^", :tCARET, [0, 1]
  end

  def test_identifier_equals_def
    assert_lex_fname "identifier=", :tIDENTIFIER, [0, 11]
  end

  def test_identifier_equals_def2
    assert_lex_fname "==", :tEQ, [0, 2]
  end

  def test_identifier_equals_expr
    @lex.state = :expr_dot
    assert_scanned("y = arg",
                   :tIDENTIFIER, "y",   [0, 1],
                   :tEQL,        "=",   [2, 3],
                   :tIDENTIFIER, "arg", [4, 7])

    assert_equal :expr_arg, @lex.state
  end

  def test_identifier_equals_or
    assert_lex_fname "|", :tPIPE, [0, 1]
  end

  def test_identifier_equals_slash
    assert_lex_fname "/", :tDIVIDE, [0, 1]
  end

  def test_identifier_equals_tilde
    @lex.state = :expr_fname
    assert_scanned("identifier=~",
                   :tIDENTIFIER, "identifier=", [0, 11],
                   :tTILDE,      "~",           [11, 12])
  end

  def test_identifier_gt
    assert_lex_fname ">", :tGT, [0, 1]
  end

  def test_identifier_le
    assert_lex_fname "<=", :tLEQ, [0, 2]
  end

  def test_identifier_lt
    assert_lex_fname "<", :tLT, [0, 1]
  end

  def test_identifier_tilde
    assert_lex_fname "~", :tTILDE, [0, 1]
  end

  def test_identifier_defined?
    assert_lex_fname "defined?", :kDEFINED, [0, 8]
  end

  def test_index
    assert_lex_fname "[]", :tAREF, [0, 2]
  end

  def test_index_equals
    assert_lex_fname "[]=", :tASET, [0, 3]
  end

  def test_integer
    assert_scanned "42", :tINTEGER, 42, [0, 2]
  end

  def test_integer_bin
    assert_scanned "0b101010", :tINTEGER, 42, [0, 8]
  end

  def test_integer_bin_bad_none
    refute_scanned "0b "
  end

  def test_integer_bin_bad_underscores
    refute_scanned "0b10__01"
  end

  def test_integer_dec
    assert_scanned "42", :tINTEGER, 42, [0, 2]
  end

  def test_integer_dec_bad_underscores
    refute_scanned "42__24"
  end

  def test_integer_dec_d
    assert_scanned "0d42", :tINTEGER, 42, [0, 4]
  end

  def test_integer_dec_d_bad_none
    refute_scanned "0d"
  end

  def test_integer_dec_d_bad_underscores
    refute_scanned "0d42__24"
  end

  def test_question_eh_a__18
    setup_lexer 18

    assert_scanned "?a", :tINTEGER, 97, [0, 2]
  end

  def test_question_eh_a__19
    setup_lexer 19

    assert_scanned '?a', :tCHARACTER, "a", [0, 2]
  end

  def test_question_eh_escape_M_escape_C__18
    setup_lexer 18

    assert_scanned '?\M-\C-a', :tINTEGER, 129, [0, 8]
  end

  def test_question_eh_escape_M_escape_C__19
    setup_lexer 19

    assert_scanned '?\M-\C-a', :tCHARACTER, "\M-\C-a", [0, 8]
  end

  def test_question_eh_escape_u_1_digit
    setup_lexer 19

    refute_scanned '?\\u1'
  end

  def test_question_eh_escape_u_2_digits
    setup_lexer 19

    refute_scanned '?\\u12'
  end

  def test_question_eh_escape_u_3_digits
    setup_lexer 19

    refute_scanned '?\\u123'
  end

  def test_question_eh_escape_u_4_digits
    setup_lexer 19
    assert_scanned '?\\u0001', :tCHARACTER, "\u0001", [0, 7]
  end

  def test_question_eh_single_unicode_point
    setup_lexer 19
    assert_scanned '?\\u{123}', :tCHARACTER, "\u0123", [0, 8]

    setup_lexer 19
    assert_scanned '?\\u{a}',  :tCHARACTER, "\n", [0, 6]
  end

  def test_question_eh_multiple_unicode_points
    setup_lexer 19
    refute_scanned '?\\u{1 2 3}'

    setup_lexer 19
    refute_scanned '?\\u{a b}'
  end

  def test_question_eh_escape_u_unclosed_bracket
    setup_lexer 19

    refute_scanned '?\\u{123'
  end

  def test_question_eh_escape_space_around_unicode_point__19
    setup_lexer 19
    refute_scanned '"\\u{1 }"'

    setup_lexer 19
    refute_scanned '"\\u{ 1}"'

    setup_lexer 19
    refute_scanned '"\\u{ 1 }"'

    setup_lexer 19
    refute_scanned '"\\u{1 2 }"'

    setup_lexer 19
    refute_scanned '"\\u{ 1 2}"'

    setup_lexer 19
    refute_scanned '"\\u{1  2}"'
  end

  def test_question_eh_escape_space_around_unicode_point__24
    setup_lexer 24
    assert_scanned '"\\u{ 1}"', :tSTRING, "\u0001", [0, 8]

    setup_lexer 24
    assert_scanned '"\\u{1 }"', :tSTRING, "\u0001", [0, 8]

    setup_lexer 24
    assert_scanned '"\\u{ 1 }"', :tSTRING, "\u0001", [0, 9]

    setup_lexer 24
    assert_scanned '"\\u{1 2 }"', :tSTRING, "\u0001\u0002", [0, 10]

    setup_lexer 24
    assert_scanned '"\\u{ 1 2}"', :tSTRING, "\u0001\u0002", [0, 10]

    setup_lexer 24
    assert_scanned '"\\u{1  2}"', :tSTRING, "\u0001\u0002", [0, 10]
  end

  def test_integer_hex
    assert_scanned "0x2a", :tINTEGER, 42, [0, 4]
  end

  def test_integer_hex_bad_none
    refute_scanned "0x "
  end

  def test_integer_hex_bad_underscores
    refute_scanned "0xab__cd"
  end

  def test_integer_oct
    assert_scanned "052", :tINTEGER, 42, [0, 3]
  end

  def test_integer_oct_bad_range
    refute_scanned "08"
  end

  def test_integer_oct_bad_underscores
    refute_scanned "01__23"
  end

  def test_integer_oct_O
    assert_scanned "0O52", :tINTEGER, 42, [0, 4]
  end

  def test_integer_oct_O_bad_range
    refute_scanned "0O1238"
  end

  def test_integer_oct_O_bad_underscores
    refute_scanned "0O1__23"
  end

  def test_integer_oct_O_not_bad_none
    assert_scanned "0O ", :tINTEGER, 0, [0, 2]
  end

  def test_integer_oct_o
    assert_scanned "0o52", :tINTEGER, 42, [0, 4]
  end

  def test_integer_oct_o_bad_range
    refute_scanned "0o1283"
  end

  def test_integer_oct_o_bad_underscores
    refute_scanned "0o1__23"
  end

  def test_integer_oct_o_not_bad_none
    assert_scanned "0o ", :tINTEGER, 0, [0, 2]
  end

  def test_integer_trailing
    assert_scanned("1.to_s",
                   :tINTEGER,    1,      [0, 1],
                   :tDOT,        '.',    [1, 2],
                   :tIDENTIFIER, 'to_s', [2, 6])
  end

  def test_integer_underscore
    assert_scanned "4_2", :tINTEGER, 42, [0, 3]
  end

  def test_integer_underscore_bad
    refute_scanned "4__2"
  end

  def test_integer_zero
    assert_scanned "0", :tINTEGER, 0, [0, 1]
  end

  def test_ivar
    assert_scanned "@blah", :tIVAR, "@blah", [0, 5]
  end

  def test_ivar_bad
    refute_scanned "@1"
  end

  def test_ivar_bad_0_length
    refute_scanned "1+@\n", :tINTEGER, 1, [0, 1], :tPLUS, "+", [1, 2]
  end

  def test_keyword_expr
    @lex.state = :expr_endarg

    assert_scanned "if", :kIF_MOD, "if", [0, 2]

    assert_equal :expr_beg, @lex.state
  end

  def test_lt
    assert_scanned "<", :tLT, "<", [0, 1]
  end

  def test_lt2
    assert_scanned("a <\< b",
                   :tIDENTIFIER, "a",   [0, 1],
                   :tLSHFT,      "<\<", [2, 4],
                   :tIDENTIFIER, "b",   [5, 6])

  end

  def test_lt2_equals
    assert_scanned("a <\<= b",
                   :tIDENTIFIER, "a",   [0, 1],
                   :tOP_ASGN,    "<\<", [2, 5],
                   :tIDENTIFIER, "b",   [6, 7])
  end

  def test_lt_equals
    assert_scanned "<=", :tLEQ, "<=", [0, 2]
  end

  def test_minus
    assert_scanned("1 - 2",
                   :tINTEGER, 1,   [0, 1],
                   :tMINUS,   "-", [2, 3],
                   :tINTEGER, 2,   [4, 5])
  end

  def test_minus_equals
    @lex.state = :expr_end

    assert_scanned "-=", :tOP_ASGN, "-", [0, 2]
  end

  def test_minus_method
    @lex.state = :expr_fname
    assert_scanned "-", :tMINUS, "-", [0, 1]
  end

  def test_minus_unary_method
    @lex.state = :expr_fname
    assert_scanned "-@", :tUMINUS, "-@", [0, 2]
  end

  def test_minus_unary_number
    assert_scanned("-42",
                   :tUNARY_NUM,  "-", [0, 1],
                   :tINTEGER,    42,  [1, 3])
  end

  def test_minus_unary_whitespace_number
    assert_scanned("- 42",
                   :tUNARY_NUM,  "-", [0, 1],
                   :tINTEGER,    42,  [2, 4])
  end

  def test_nth_ref
    assert_scanned('[$1, $2, $3]',
                   :tLBRACK,  "[", [0, 1],
                   :tNTH_REF, 1,   [1, 3], :tCOMMA, ",", [3, 4],
                   :tNTH_REF, 2,   [5, 7], :tCOMMA, ",", [7, 8],
                   :tNTH_REF, 3,   [9, 11],
                   :tRBRACK,  "]", [11, 12])
  end

  def test_open_bracket
    assert_scanned("(", :tLPAREN, "(", [0, 1])
  end

  def test_open_bracket_cmdarg
    assert_scanned("m (", :tIDENTIFIER, "m", [0, 1],
                          :tLPAREN_ARG, "(", [2, 3])
  end

  def test_open_bracket_exprarg
    assert_scanned("m(", :tIDENTIFIER, "m", [0, 1],
                         :tLPAREN2,    "(", [1, 2])
  end

  def test_open_curly_bracket
    assert_scanned("{",
                   :tLBRACE, "{", [0, 1])
  end

  def test_open_curly_bracket_arg
    assert_scanned("m { 3 }",
                   :tIDENTIFIER, "m", [0, 1],
                   :tLCURLY,     "{", [2, 3],
                   :tINTEGER,    3,   [4, 5],
                   :tRCURLY,     "}", [6, 7])
  end

  def test_open_curly_bracket_block
    @lex.state = :expr_endarg # seen m(3)

    assert_scanned("{ 4 }",
                   :tLBRACE_ARG, "{", [0, 1],
                   :tINTEGER,    4,   [2, 3],
                   :tRCURLY,     "}", [4, 5])
  end

  def test_open_square_bracket_arg
    assert_scanned("m [ 3 ]",
                   :tIDENTIFIER, "m", [0, 1],
                   :tLBRACK,     "[", [2, 3],
                   :tINTEGER,    3,   [4, 5],
                   :tRBRACK,     "]", [6, 7])
  end

  def test_open_square_bracket_ary
    assert_scanned("[1, 2, 3]",
                   :tLBRACK,  "[", [0, 1],
                   :tINTEGER, 1,   [1, 2],
                   :tCOMMA,   ",", [2, 3],
                   :tINTEGER, 2,   [4, 5],
                   :tCOMMA,   ",", [5, 6],
                   :tINTEGER, 3,   [7, 8],
                   :tRBRACK,  "]", [8, 9])
  end

  def test_open_square_bracket_meth
    assert_scanned("m[3]",
                   :tIDENTIFIER, "m", [0, 1],
                   :tLBRACK2,    "[", [1, 2],
                   :tINTEGER,    3,   [2, 3],
                   :tRBRACK,     "]", [3, 4])
  end

  def test_or
    assert_scanned "|", :tPIPE, "|", [0, 1]
  end

  def test_or2
    assert_scanned "||", :tOROP, "||", [0, 2]
  end

  def test_or2_equals
    assert_scanned "||=", :tOP_ASGN, "||", [0, 3]
  end

  def test_or_equals
    assert_scanned "|=", :tOP_ASGN, "|", [0, 2]
  end

  def test_percent
    assert_scanned("a % 2",
                   :tIDENTIFIER, "a", [0, 1],
                   :tPERCENT,    "%", [2, 3],
                   :tINTEGER,    2,   [4, 5])
  end

  def test_percent_equals
    assert_scanned("a %= 2",
                   :tIDENTIFIER, "a", [0, 1],
                   :tOP_ASGN,    "%", [2, 4],
                   :tINTEGER,    2,   [5, 6])
  end

  def test_plus
    assert_scanned("1 + 1",
                   :tINTEGER, 1,   [0, 1],
                   :tPLUS,    "+", [2, 3],
                   :tINTEGER, 1,   [4, 5])
  end

  def test_plus_equals
    @lex.state = :expr_end

    assert_scanned "+=", :tOP_ASGN, "+", [0, 2]
  end

  def test_plus_method
    @lex.state = :expr_fname
    assert_scanned "+", :tPLUS, "+", [0, 1]
  end

  def test_plus_unary_method
    @lex.state = :expr_fname
    assert_scanned "+@", :tUPLUS, "+@", [0, 2]
  end

  def test_plus_unary_number
    assert_scanned("+42",
                   :tUNARY_NUM,  "+", [0, 1],
                   :tINTEGER,    42,  [1, 3])
  end

  def test_plus_unary_whitespace_number
    assert_scanned("+ 42",
                   :tUNARY_NUM,  "+", [0, 1],
                   :tINTEGER,    42,  [2, 4])
  end

  def test_numbers
    assert_scanned "0b10", :tINTEGER, 2, [0, 4]
    assert_scanned "0B10", :tINTEGER, 2, [0, 4]

    assert_scanned "0d10", :tINTEGER, 10, [0, 4]
    assert_scanned "0D10", :tINTEGER, 10, [0, 4]

    assert_scanned "0x10", :tINTEGER, 16, [0, 4]
    assert_scanned "0X10", :tINTEGER, 16, [0, 4]

    assert_scanned "0o10", :tINTEGER, 8, [0, 4]
    assert_scanned "0O10", :tINTEGER, 8, [0, 4]
    assert_scanned "0o",   :tINTEGER, 0, [0, 2]
    assert_scanned "0O",   :tINTEGER, 0, [0, 2]

    assert_scanned "0o",   :tINTEGER, 0, [0, 2]
    assert_scanned "0O",   :tINTEGER, 0, [0, 2]

    assert_scanned "0777_333", :tINTEGER, 261851, [0, 8]

    assert_scanned "0",    :tINTEGER, 0, [0, 1]

    refute_scanned "0x"
    refute_scanned "0X"
    refute_scanned "0b"
    refute_scanned "0B"
    refute_scanned "0d"
    refute_scanned "0D"

    refute_scanned "08"
    refute_scanned "09"
    refute_scanned "0o8"
    refute_scanned "0o9"
    refute_scanned "0O8"
    refute_scanned "0O9"

    refute_scanned "1_e1"
    refute_scanned "1_.1"
    refute_scanned "1__1"

    refute_scanned "1end"
    refute_scanned "1.1end"
  end

  def test_question__18
    setup_lexer 18

    assert_scanned "?*", :tINTEGER, 42, [0, 2]
  end

  def test_question__19
    setup_lexer 19

    assert_scanned "?*", :tCHARACTER, "*", [0, 2]
  end

  def test_question_bad_eos
    refute_scanned "?"
  end

  def test_question_bad_ws
    assert_scanned "? ",  :tEH, "?", [0, 1]
    assert_scanned "?\n", :tEH, "?", [0, 1]
    assert_scanned "?\t", :tEH, "?", [0, 1]
    assert_scanned "?\v", :tEH, "?", [0, 1]
    assert_scanned "?\r", :tEH, "?", [0, 1]
    assert_scanned "?\f", :tEH, "?", [0, 1]
  end

  def test_question_ws_backslashed__18
    setup_lexer 18

    @lex.state = :expr_beg
    assert_scanned "?\\ ", :tINTEGER, 32, [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\n", :tINTEGER, 10, [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\t", :tINTEGER, 9, [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\v", :tINTEGER, 11, [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\r", :tINTEGER, 13, [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\f", :tINTEGER, 12, [0, 3]
  end

  def test_question_ws_backslashed__19
    setup_lexer 19

    @lex.state = :expr_beg
    assert_scanned "?\\ ", :tCHARACTER, " ", [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\n", :tCHARACTER, "\n", [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\t", :tCHARACTER, "\t", [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\v", :tCHARACTER, "\v", [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\r", :tCHARACTER, "\r", [0, 3]
    @lex.state = :expr_beg
    assert_scanned "?\\f", :tCHARACTER, "\f", [0, 3]
  end

  def test_rbracket
    assert_scanned "]", :tRBRACK, "]", [0, 1]
  end

  def test_rcurly
    assert_scanned "}", :tRCURLY, "}", [0, 1]
  end

  def test_regexp
    assert_scanned("/regexp/",
                   :tREGEXP_BEG,     "/",      [0, 1],
                   :tSTRING_CONTENT, "regexp", [1, 7],
                   :tSTRING_END,     "/",      [7, 8],
                   :tREGEXP_OPT,     "",       [8, 8])
  end

  def test_regexp_ambiguous
    assert_scanned("method /regexp/",
                   :tIDENTIFIER,     "method", [0, 6],
                   :tREGEXP_BEG,     "/",      [7, 8],
                   :tSTRING_CONTENT, "regexp", [8, 14],
                   :tSTRING_END,     "/",      [14, 15],
                   :tREGEXP_OPT,     "",       [15, 15])
  end

  def test_regexp_bad
    refute_scanned("/.*/xyz",
                   :tREGEXP_BEG,     "/",  [0, 1],
                   :tSTRING_CONTENT, ".*", [1, 3],
                   :tSTRING_END,     "/",  [3, 4])
  end

  def test_regexp_escape_C
    assert_scanned('/regex\\C-x/',
                   :tREGEXP_BEG,     "/",          [0, 1],
                   :tSTRING_CONTENT, "regex\\C-x", [1, 10],
                   :tSTRING_END,     "/",          [10, 11],
                   :tREGEXP_OPT,     "",           [11, 11])
  end

  def test_regexp_escape_C_M
    assert_scanned('/regex\\C-\\M-x/',
                   :tREGEXP_BEG,     "/",              [0, 1],
                   :tSTRING_CONTENT, "regex\\C-\\M-x", [1, 13],
                   :tSTRING_END,     "/",              [13, 14],
                   :tREGEXP_OPT,     "",               [14, 14])
  end

  def test_regexp_escape_C_M_craaaazy
    assert_scanned("/regex\\C-\\\n\\M-x/",
                   :tREGEXP_BEG,     "/",              [0, 1],
                   :tSTRING_CONTENT, "regex\\C-\\M-x", [1, 15],
                   :tSTRING_END,     "/",              [15, 16],
                   :tREGEXP_OPT,     "",               [16, 16])
  end

  def test_regexp_escape_C_bad_dash
    refute_scanned '/regex\\Cx/', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_C_bad_dash_eos
    refute_scanned '/regex\\C-/', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_C_bad_dash_eos2
    refute_scanned '/regex\\C-', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_C_bad_eos
    refute_scanned '/regex\\C/', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_C_bad_eos2
    refute_scanned '/regex\\c', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_M
    assert_scanned('/regex\\M-x/',
                   :tREGEXP_BEG,     "/",          [0, 1],
                   :tSTRING_CONTENT, "regex\\M-x", [1, 10],
                   :tSTRING_END,     "/",          [10, 11],
                   :tREGEXP_OPT,     "",           [11, 11])
  end

  def test_regexp_escape_M_C
    assert_scanned('/regex\\M-\\C-x/',
                   :tREGEXP_BEG,     "/",              [0, 1],
                   :tSTRING_CONTENT, "regex\\M-\\C-x", [1, 13],
                   :tSTRING_END,     "/",              [13, 14],
                   :tREGEXP_OPT,     "",               [14, 14])
  end

  def test_regexp_escape_M_bad_dash
    refute_scanned '/regex\\Mx/', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_M_bad_dash_eos
    refute_scanned '/regex\\M-/', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_M_bad_dash_eos2
    refute_scanned '/regex\\M-', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_M_bad_eos
    refute_scanned '/regex\\M/', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_backslash_slash
    assert_scanned('/\\//',
                   :tREGEXP_BEG,     "/", [0, 1],
                   :tSTRING_CONTENT, '/', [1, 3],
                   :tSTRING_END,     "/", [3, 4],
                   :tREGEXP_OPT,     "",  [4, 4])
  end

  def test_regexp_escape_backslash_terminator
    assert_scanned('%r%blah\\%blah%',
                   :tREGEXP_BEG,     "%r%",       [0, 3],
                   :tSTRING_CONTENT, "blah%blah", [3, 13],
                   :tSTRING_END,     "%",         [13, 14],
                   :tREGEXP_OPT,     "",          [14, 14])
  end

  def test_regexp_escape_backslash_terminator_meta1
    assert_scanned('%r{blah\\}blah}',
                   :tREGEXP_BEG,     "%r{",         [0, 3],
                   :tSTRING_CONTENT, "blah\\}blah", [3, 13],
                   :tSTRING_END,     "}",           [13, 14],
                   :tREGEXP_OPT,     "",            [14, 14])
  end

  def test_regexp_escape_backslash_terminator_meta2
    assert_scanned('%r/blah\\/blah/',
                   :tREGEXP_BEG,     "%r/",       [0, 3],
                   :tSTRING_CONTENT, "blah/blah", [3, 13],
                   :tSTRING_END,     "/",         [13, 14],
                   :tREGEXP_OPT,     "",          [14, 14])
  end

  def test_regexp_escape_backslash_terminator_meta3
    assert_scanned('%r/blah\\%blah/',
                   :tREGEXP_BEG,     "%r/",         [0, 3],
                   :tSTRING_CONTENT, "blah\\%blah", [3, 13],
                   :tSTRING_END,     "/",           [13, 14],
                   :tREGEXP_OPT,     "",            [14, 14])
  end

  def test_regexp_escape_bad_eos
    refute_scanned '/regex\\', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_bs
    assert_scanned('/regex\\\\regex/',
                   :tREGEXP_BEG,     "/",              [0, 1],
                   :tSTRING_CONTENT, "regex\\\\regex", [1, 13],
                   :tSTRING_END,     "/",              [13, 14],
                   :tREGEXP_OPT,     "",               [14, 14])
  end

  def test_regexp_escape_c
    assert_scanned('/regex\\cxxx/',
                   :tREGEXP_BEG,     "/",           [0, 1],
                   :tSTRING_CONTENT, "regex\\cxxx", [1, 11],
                   :tSTRING_END,     "/",           [11, 12],
                   :tREGEXP_OPT,     "",            [12, 12])
  end

  def test_regexp_escape_c_backslash
    assert_scanned('/regex\\c\\n/',
                   :tREGEXP_BEG,     "/",           [0, 1],
                   :tSTRING_CONTENT, "regex\\c\\n", [1, 10],
                   :tSTRING_END,     "/",           [10, 11],
                   :tREGEXP_OPT,     "",            [11, 11])
  end

  def test_regexp_escape_chars
    assert_scanned('/re\\tge\\nxp/',
                   :tREGEXP_BEG,     "/",            [0, 1],
                   :tSTRING_CONTENT, "re\\tge\\nxp", [1, 11],
                   :tSTRING_END,     "/",            [11, 12],
                   :tREGEXP_OPT,     "",             [12, 12])
  end

  def test_regexp_escape_double_backslash
    assert_scanned('/[\\/\\\\]$/',
                   :tREGEXP_BEG,     "/",       [0, 1],
                   :tSTRING_CONTENT,'[/\\\\]$', [1, 8],
                   :tSTRING_END,     "/",       [8, 9],
                   :tREGEXP_OPT,     "",        [9, 9])
  end

  def test_regexp_escape_hex
    assert_scanned('/regex\\x61xp/',
                   :tREGEXP_BEG,     "/",            [0, 1],
                   :tSTRING_CONTENT, "regex\\x61xp", [1, 12],
                   :tSTRING_END,     "/",            [12, 13],
                   :tREGEXP_OPT,     "",             [13, 13])
  end

  def test_regexp_escape_hex_bad
    refute_scanned '/regex\\xzxp/', :tREGEXP_BEG, "/", [0, 1]
  end

  def test_regexp_escape_hex_one
    assert_scanned('/^[\\xd\\xa]{2}/on',
                   :tREGEXP_BEG,     '/',              [0, 1],
                   :tSTRING_CONTENT, '^[\\xd\\xa]{2}', [1, 13],
                   :tSTRING_END,     "/",              [13, 14],
                   :tREGEXP_OPT,     'on',             [14, 16])
  end

  def test_regexp_escape_oct1
    assert_scanned('/regex\\0xp/',
                   :tREGEXP_BEG,     "/",          [0, 1],
                   :tSTRING_CONTENT, "regex\\0xp", [1, 10],
                   :tSTRING_END,     "/",          [10, 11],
                   :tREGEXP_OPT,     "",           [11, 11])
  end

  def test_regexp_escape_oct2
    assert_scanned('/regex\\07xp/',
                   :tREGEXP_BEG,     "/",           [0, 1],
                   :tSTRING_CONTENT, "regex\\07xp", [1, 11],
                   :tSTRING_END,     "/",           [11, 12],
                   :tREGEXP_OPT,     "",            [12, 12])
  end

  def test_regexp_escape_oct3
    assert_scanned('/regex\\10142/',
                   :tREGEXP_BEG,     "/",            [0, 1],
                   :tSTRING_CONTENT, "regex\\10142", [1, 12],
                   :tSTRING_END,     "/",            [12, 13],
                   :tREGEXP_OPT,     "",             [13, 13])
  end

  def test_regexp_escape_return
    assert_scanned("/regex\\\nregex/",
                   :tREGEXP_BEG,     "/",          [0, 1],
                   :tSTRING_CONTENT, "regexregex", [1, 13],
                   :tSTRING_END,     "/",          [13, 14],
                   :tREGEXP_OPT,     "",           [14, 14])
  end

  def test_regexp_escape_delimiter_meta
    assert_scanned("%r(\\))",
                   :tREGEXP_BEG,     "%r(", [0, 3],
                   :tSTRING_CONTENT, "\\)", [3, 5],
                   :tSTRING_END,     ")",   [5, 6],
                   :tREGEXP_OPT,     "",    [6, 6])
  end

  def test_regexp_escape_delimiter_nonmeta
    assert_scanned("%r'\\''",
                   :tREGEXP_BEG,     "%r'", [0, 3],
                   :tSTRING_CONTENT, "'",   [3, 5],
                   :tSTRING_END,     "'",   [5, 6],
                   :tREGEXP_OPT,     "",    [6, 6])
  end

  def test_regexp_escape_other_meta
    assert_scanned("/\\.\\$\\*\\+\\.\\?\\|/",
                   :tREGEXP_BEG,     "/",                     [0, 1],
                   :tSTRING_CONTENT, "\\.\\$\\*\\+\\.\\?\\|", [1, 15],
                   :tSTRING_END,     "/",                     [15, 16],
                   :tREGEXP_OPT,     "",                      [16, 16])
  end

  def test_regexp_nm
    assert_scanned("/.*/nm",
                   :tREGEXP_BEG,     "/",  [0, 1],
                   :tSTRING_CONTENT, ".*", [1, 3],
                   :tSTRING_END,     "/",  [3, 4],
                   :tREGEXP_OPT,     "nm", [4, 6])
  end

  def test_rparen
    assert_scanned ")", :tRPAREN, ")", [0, 1]
  end

  def test_rshft
    assert_scanned("a >> 2",
                   :tIDENTIFIER, "a",  [0, 1],
                   :tRSHFT,      ">>", [2, 4],
                   :tINTEGER,    2,    [5, 6])
  end

  def test_rshft_equals
    assert_scanned("a >>= 2",
                   :tIDENTIFIER, "a",  [0, 1],
                   :tOP_ASGN,    ">>", [2, 5],
                   :tINTEGER,    2,    [6, 7])
  end

  def test_star
    assert_scanned("a * ",
                   :tIDENTIFIER, "a", [0, 1],
                   :tSTAR2,      "*", [2, 3])

    assert_equal :expr_value, @lex.state
  end

  def test_star2
    assert_scanned("a ** ",
                   :tIDENTIFIER, "a",  [0, 1],
                   :tPOW,        "**", [2, 4])

    assert_equal :expr_value, @lex.state
  end

  def test_star2_equals
    assert_scanned("a **= ",
                   :tIDENTIFIER, "a",  [0, 1],
                   :tOP_ASGN,    "**", [2, 5])

    assert_equal :expr_beg, @lex.state
  end

  def test_star2_beg
    assert_scanned("** ",
                   :tDSTAR, "**", [0, 2])

    assert_equal :expr_beg, @lex.state
  end

  def test_star_arg
    @lex.state = :expr_arg

    assert_scanned(" *a",
                   :tSTAR,       "*", [1, 2],
                   :tIDENTIFIER, "a", [2, 3])

    assert_equal :expr_arg, @lex.state
  end

  def test_star_arg_beg
    @lex.state = :expr_beg

    assert_scanned("*a",
                   :tSTAR,       "*", [0, 1],
                   :tIDENTIFIER, "a", [1, 2])

    assert_equal :expr_arg, @lex.state
  end

  def test_star_arg_beg_fname
    @lex.state = :expr_fname

    assert_scanned("*a",
                   :tSTAR2,      "*", [0, 1],
                   :tIDENTIFIER, "a", [1, 2])

    assert_equal :expr_arg, @lex.state
  end

  def test_star_equals
    assert_scanned("a *= ",
                   :tIDENTIFIER, "a", [0, 1],
                   :tOP_ASGN,    "*", [2, 4])

    assert_equal :expr_beg, @lex.state
  end

  def test_string_bad_eos
    refute_scanned('%',
                   :tSTRING_BEG, '%', [0, 1])
  end

  def test_string_bad_eos_quote
    refute_scanned('%{nest',
                   :tSTRING_BEG, '%}', [0, 2])
  end

  def test_string_double
    assert_scanned('"string"',
                   :tSTRING, "string", [0, 8])
  end

  def test_string_double_escape_C
    assert_scanned('"\\C-a"',
                   :tSTRING, "\001", [0, 6])
  end

  def test_string_double_escape_C_backslash
    assert_scanned('"\\C-\\\\"',
                   :tSTRING, "\034", [0, 7])
  end

  def test_string_double_escape_C_escape
    assert_scanned('"\\C-\\M-a"',
                   :tSTRING, "\201", [0, 9])
  end

  def test_string_double_escape_C_question
    assert_scanned('"\\C-?"',
                   :tSTRING, "\177", [0, 6])
  end

  def test_string_double_escape_M
    assert_scanned('"\\M-a"',
                   :tSTRING, "\341", [0, 6])
  end

  def test_string_double_escape_M_backslash
    assert_scanned('"\\M-\\\\"',
                   :tSTRING, "\334", [0, 7])
  end

  def test_string_double_escape_M_escape
    assert_scanned('"\\M-\\C-a"',
                   :tSTRING, "\201", [0, 9])
  end

  def test_string_double_escape_bs1
    assert_scanned('"a\\a\\a"',
                   :tSTRING, "a\a\a", [0, 7])
  end

  def test_string_double_escape_bs2
    assert_scanned('"a\\\\a"',
                   :tSTRING, "a\\a", [0, 6])
  end

  def test_string_double_escape_c
    assert_scanned('"\\ca"',
                   :tSTRING, "\001", [0, 5])
  end

  def test_string_double_escape_c_escape
    assert_scanned('"\\c\\M-a"',
                   :tSTRING, "\201", [0, 8])
  end

  def test_string_double_escape_c_question
    assert_scanned('"\\c?"',
                   :tSTRING, "\177", [0, 5])
  end

  def test_string_double_escape_chars
    assert_scanned('"s\\tri\\ng"',
                   :tSTRING, "s\tri\ng", [0, 10])
  end

  def test_string_double_escape_hex
    assert_scanned('"n = \\x61\\x62\\x63"',
                   :tSTRING, "n = abc", [0, 18])
  end

  def test_string_double_escape_octal
    assert_scanned('"n = \\101\\102\\103"',
                   :tSTRING, "n = ABC", [0, 18])
  end

  def test_string_double_escape_octal_wrap
    assert_scanned('"\\753"',
                   :tSTRING, "\xEB", [0, 6])
  end

  def test_string_double_interp
    assert_scanned("\"blah #x a \#@a b \#$b c \#{3} # \"",
                   :tSTRING_BEG,     "\"",         [0, 1],
                   :tSTRING_CONTENT, "blah #x a ", [1, 11],
                   :tSTRING_DVAR,    nil,          [11, 12],
                   :tIVAR,           "@a",         [12, 14],
                   :tSTRING_CONTENT, " b ",        [14, 17],
                   :tSTRING_DVAR,    nil,          [17, 18],
                   :tGVAR,           "$b",         [18, 20],
                   :tSTRING_CONTENT, " c ",        [20, 23],
                   :tSTRING_DBEG,    '#{',         [23, 25],
                   :tINTEGER,        3,            [25, 26],
                   :tRCURLY,         "}",          [26, 27],
                   :tSTRING_CONTENT, " # ",        [27, 30],
                   :tSTRING_END,     "\"",         [30, 31])
  end

  def test_string_double_interp_label
    assert_scanned('"#{foo:bar}"',
                   :tSTRING_BEG,   '"',   [0, 1],
                   :tSTRING_DBEG,  '#{',  [1, 3],
                   :tIDENTIFIER,   'foo', [3, 6],
                   :tSYMBOL,       'bar', [6, 10],
                   :tRCURLY,       '}',   [10, 11],
                   :tSTRING_END,   '"',   [11, 12])
  end

  def test_string_double_nested_curlies
    assert_scanned('%{nest{one{two}one}nest}',
                   :tSTRING_BEG,     '%{',                    [0, 2],
                   :tSTRING_CONTENT, "nest{one{two}one}nest", [2, 23],
                   :tSTRING_END,     '}',                     [23, 24])
  end

  def test_string_double_no_interp
    assert_scanned("\"# blah\"",                                # pound first
                   :tSTRING, "# blah", [0, 8])

    assert_scanned("\"blah # blah\"",                           # pound not first
                   :tSTRING, "blah # blah", [0, 13])
  end

  def test_string_escape_x_single
    assert_scanned('"\\x0"',
                   :tSTRING, "\000", [0, 5])
  end

  def test_string_pct_Q
    assert_scanned("%Q[s1 s2]",
                   :tSTRING_BEG,     '%Q[',   [0, 3],
                   :tSTRING_CONTENT, "s1 s2", [3, 8],
                   :tSTRING_END,     ']',     [8, 9])
  end

  def test_string_pct_W
    assert_scanned("%W[s1 s2\ns3]",
                   :tWORDS_BEG,      "%W[", [0, 3],
                   :tSTRING_CONTENT, "s1",  [3, 5],
                   :tSPACE,          nil,   [5, 6],
                   :tSTRING_CONTENT, "s2",  [6, 8],
                   :tSPACE,          nil,   [8, 9],
                   :tSTRING_CONTENT, "s3",  [9, 11],
                   :tSPACE,          nil,   [11, 11],
                   :tSTRING_END,     ']',   [11, 12])
  end

  def test_string_pct_W_bs_nl
    assert_scanned("%W[s1 \\\ns2]",
                   :tWORDS_BEG,      "%W[",  [0, 3],
                   :tSTRING_CONTENT, "s1",   [3, 5],
                   :tSPACE,          nil,    [5, 6],
                   :tSTRING_CONTENT, "\ns2", [6, 10],
                   :tSPACE,          nil,    [10, 10],
                   :tSTRING_END,     ']',    [10, 11])
  end

  def test_string_pct_W_interp
    assert_scanned('%W[#{1}#{2} #@a]',
                   :tWORDS_BEG,    '%W[', [0, 3],
                   :tSTRING_DBEG,  '#{',  [3, 5],
                   :tINTEGER,      1,     [5, 6],
                   :tRCURLY,       '}',   [6, 7],
                   :tSTRING_DBEG,  '#{',  [7, 9],
                   :tINTEGER,      2,     [9, 10],
                   :tRCURLY,       '}',   [10, 11],
                   :tSPACE,        nil,   [11, 12],
                   :tSTRING_DVAR,  nil,   [12, 13],
                   :tIVAR,         '@a',  [13, 15],
                   :tSPACE,        nil,   [15, 15],
                   :tSTRING_END,   ']',   [15, 16])
  end

  def test_string_pct_I
    assert_scanned("%I(s1 s2)",
                   :tSYMBOLS_BEG,    "%I(", [0, 3],
                   :tSTRING_CONTENT, "s1",  [3, 5],
                   :tSPACE,          nil,   [5, 6],
                   :tSTRING_CONTENT, "s2",  [6, 8],
                   :tSPACE,          nil,   [8, 8],
                   :tSTRING_END,     ')',   [8, 9])
  end

  def test_string_pct_angle
    assert_scanned("%<blah>",
                   :tSTRING_BEG,     '%<',   [0, 2],
                   :tSTRING_CONTENT, "blah", [2, 6],
                   :tSTRING_END,     '>',    [6, 7])
  end

  def test_string_pct_pct
    assert_scanned("%%blah%",
                   :tSTRING_BEG,     '%%',   [0, 2],
                   :tSTRING_CONTENT, "blah", [2, 6],
                   :tSTRING_END,     '%',    [6, 7])
  end

  def test_string_pct_w
    assert_scanned("%w[s1 s2 ]",
                   :tQWORDS_BEG,     "%w[", [0, 3],
                   :tSTRING_CONTENT, "s1",  [3, 5],
                   :tSPACE,          nil,   [5, 6],
                   :tSTRING_CONTENT, "s2",  [6, 8],
                   :tSPACE,          nil,   [8, 9],
                   :tSTRING_END,     "]",   [9, 10])
  end

  def test_string_pct_w_incomplete
    refute_scanned("%w[s1 ",
                   :tQWORDS_BEG,     "%w[", [0, 3],
                   :tSTRING_CONTENT, "s1",  [3, 5],
                   :tSPACE,          nil,   [5, 6])
  end

  def test_string_pct_w_bs_nl
    assert_scanned("%w[s1 \\\ns2]",
                   :tQWORDS_BEG,     "%w[",  [0, 3],
                   :tSTRING_CONTENT, "s1",   [3, 5],
                   :tSPACE,          nil,    [5, 6],
                   :tSTRING_CONTENT, "\ns2", [6, 10],
                   :tSPACE,          nil,    [10, 10],
                   :tSTRING_END,     ']',    [10, 11])
  end

  def test_string_pct_w_bs_sp
    assert_scanned("%w[s\\ 1 s\\ 2]",
                   :tQWORDS_BEG,     "%w[", [0, 3],
                   :tSTRING_CONTENT, "s 1", [3, 7],
                   :tSPACE,          nil,   [7, 8],
                   :tSTRING_CONTENT, "s 2", [8, 12],
                   :tSPACE,          nil,   [12, 12],
                   :tSTRING_END,     ']',   [12, 13])
  end

  def test_string_pct_w_tab
    assert_scanned("%w[abc\tdef]",
                   :tQWORDS_BEG,     "%w[", [0, 3],
                   :tSTRING_CONTENT, "abc", [3, 6],
                   :tSPACE,          nil,   [6, 7],
                   :tSTRING_CONTENT, "def", [7, 10],
                   :tSPACE,          nil,   [10, 10],
                   :tSTRING_END,     ']',   [10, 11])
  end

  def test_string_pct_i
    assert_scanned("%i(s1 s2)",
                   :tQSYMBOLS_BEG,   "%i(", [0, 3],
                   :tSTRING_CONTENT, "s1",  [3, 5],
                   :tSPACE,          nil,   [5, 6],
                   :tSTRING_CONTENT, "s2",  [6, 8],
                   :tSPACE,          nil,   [8, 8],
                   :tSTRING_END,     ')',   [8, 9])
  end

  def test_string_pct_backslash
    assert_scanned("%\\a\\",
                   :tSTRING_BEG,     "%\\", [0, 2],
                   :tSTRING_CONTENT, "a",   [2, 3],
                   :tSTRING_END,     "\\",  [3, 4])
  end

  def test_string_pct_w_backslash
    assert_scanned("%w\\s1 s2 \\",
                   :tQWORDS_BEG,     "%w\\", [0, 3],
                   :tSTRING_CONTENT, "s1",  [3, 5],
                   :tSPACE,          nil,   [5, 6],
                   :tSTRING_CONTENT, "s2",  [6, 8],
                   :tSPACE,          nil,   [8, 9],
                   :tSTRING_END,     "\\",   [9, 10])
  end

  def test_string_pct_w_backslash_nl
    assert_scanned("%w\\s1 s2 \\\n",
                   :tQWORDS_BEG,     "%w\\", [0, 3],
                   :tSTRING_CONTENT, "s1",   [3, 5],
                   :tSPACE,          nil,    [5, 6],
                   :tSTRING_CONTENT, "s2",   [6, 8],
                   :tSPACE,          nil,    [8, 9],
                   :tSTRING_END,     "\\",   [9, 10],
                   :tNL,             nil,    [10, 11])
  end

  def test_string_pct_w_backslash_interp_nl
    assert_scanned("%W\\blah #x a \#@a b \#$b c \#{3} # \\",
                   :tWORDS_BEG,     "%W\\",  [0, 3],
                   :tSTRING_CONTENT, "blah", [3, 7],
                   :tSPACE,          nil,    [7, 8],
                   :tSTRING_CONTENT, "#x",   [8, 10],
                   :tSPACE,          nil,    [10, 11],
                   :tSTRING_CONTENT, "a",    [11, 12],
                   :tSPACE,          nil,    [12, 13],
                   :tSTRING_DVAR,    nil,    [13, 14],
                   :tIVAR,           "@a",   [14, 16],
                   :tSPACE,          nil,    [16, 17],
                   :tSTRING_CONTENT, "b",    [17, 18],
                   :tSPACE,          nil,    [18, 19],
                   :tSTRING_DVAR,    nil,    [19, 20],
                   :tGVAR,           "$b",   [20, 22],
                   :tSPACE,          nil,    [22, 23],
                   :tSTRING_CONTENT, "c",    [23, 24],
                   :tSPACE,          nil,    [24, 25],
                   :tSTRING_DBEG,    '#{',   [25, 27],
                   :tINTEGER,        3,      [27, 28],
                   :tRCURLY,         "}",    [28, 29],
                   :tSPACE,          nil,    [29, 30],
                   :tSTRING_CONTENT, "#",    [30, 31],
                   :tSPACE,          nil,    [31, 32],
                   :tSTRING_END,     "\\",   [32, 33])
  end

  def test_string_pct_backslash_with_bad_escape
    # No escapes are allowed in a backslash-delimited string
    refute_scanned("%\\a\\n\\",
                   :tSTRING_BEG,     "%\\", [0, 2],
                   :tSTRING_CONTENT, "a",   [2, 3],
                   :tSTRING_END,     "\\",  [3, 4],
                   :tIDENTIFIER,     "n",   [4, 5])
  end

  def test_string_pct_intertwined_with_heredoc
    assert_scanned("<<-foo + %\\a\nbar\nfoo\nb\\",
                   :tSTRING_BEG,     "<<\"",  [0, 6],
                   :tSTRING_CONTENT, "bar\n", [13, 17],
                   :tSTRING_END,     "foo",   [17, 20],
                   :tPLUS,           "+",     [7, 8],
                   :tSTRING_BEG,     "%\\",   [9, 11],
                   :tSTRING_CONTENT, "a\n",   [11, 13],
                   :tSTRING_CONTENT, "b",     [21, 22],
                   :tSTRING_END,     "\\",    [22, 23])
  end

  def test_string_pct_q_backslash
    assert_scanned("%q\\a\\",
                   :tSTRING_BEG,     "%q\\", [0, 3],
                   :tSTRING_CONTENT, "a",    [3, 4],
                   :tSTRING_END,     "\\",   [4, 5])
  end

  def test_string_pct_Q_backslash
    assert_scanned("%Q\\a\\",
                   :tSTRING_BEG,     "%Q\\", [0, 3],
                   :tSTRING_CONTENT, "a",    [3, 4],
                   :tSTRING_END,     "\\",   [4, 5])
  end

  def test_string_single
    assert_scanned("'string'",
                   :tSTRING, "string", [0, 8])
  end

  def test_string_single_escape_chars
    assert_scanned("'s\\tri\\ng'",
                   :tSTRING, "s\\tri\\ng", [0, 10])
  end

  def test_string_single_nl
    assert_scanned("'blah\\\nblah'",
                   :tSTRING_BEG,     "'",        [0, 1],
                   :tSTRING_CONTENT, "blah\\\n", [1, 7],
                   :tSTRING_CONTENT, "blah",     [7, 11],
                   :tSTRING_END,     "'",        [11, 12])
  end

  def test_symbol
    assert_scanned(":symbol",
                   :tSYMBOL, "symbol", [0, 7])
  end

  def test_symbol_double
    assert_scanned(":\"symbol\"",
                   :tSYMBEG,         ":\"",    [0, 2],
                   :tSTRING_CONTENT, "symbol", [2, 8],
                   :tSTRING_END,     "\"",     [8, 9])
  end

  def test_symbol_single
    assert_scanned(":'symbol'",
                   :tSYMBEG,         ":'",     [0, 2],
                   :tSTRING_CONTENT, "symbol", [2, 8],
                   :tSTRING_END,     "'",      [8, 9])
  end

  def test_ternary
    assert_scanned("a ? b : c",
                   :tIDENTIFIER, "a", [0, 1],
                   :tEH,         "?", [2, 3],
                   :tIDENTIFIER, "b", [4, 5],
                   :tCOLON,      ":", [6, 7],
                   :tIDENTIFIER, "c", [8, 9])

    assert_scanned("a ?b : c",
                   :tIDENTIFIER, "a", [0, 1],
                   :tINTEGER,    98,  [2, 4],
                   :tCOLON,      ":", [5, 6],
                   :tIDENTIFIER, "c", [7, 8])

    assert_scanned("a ?bb : c", # GAH! MATZ!!!
                   :tIDENTIFIER, "a",  [0, 1],
                   :tEH,         "?",  [2, 3],
                   :tIDENTIFIER, "bb", [3, 5],
                   :tCOLON,      ":",  [6, 7],
                   :tIDENTIFIER, "c",  [8, 9])

    assert_scanned("42 ?", # 42 forces expr_end
                   :tINTEGER,    42,  [0, 2],
                   :tEH,         "?", [3, 4])
  end

  def test_tilde
    assert_scanned "~", :tTILDE, "~", [0, 1]
  end

  def test_tilde_unary
    @lex.state = :expr_fname
    assert_scanned "~@", :tTILDE, "~@", [0, 2]
  end

  def test_uminus
    assert_scanned("-blah",
                   :tUMINUS,     "-",    [0, 1],
                   :tIDENTIFIER, "blah", [1, 5])
  end

  def test_underscore
    assert_scanned("_var", :tIDENTIFIER, "_var", [0, 4])
  end

  def test_underscore_end
    assert_scanned("__END__\n")
    assert_scanned("__END__")
    assert_scanned("__END__ foo",
                   :tIDENTIFIER, '__END__', [0, 7],
                   :tIDENTIFIER, 'foo',     [8, 11])
    assert_scanned("__END__\rfoo",
                   :tIDENTIFIER, '__END__', [0, 7],
                   :tIDENTIFIER, 'foo',     [8, 11])
  end

  def test_uplus
    assert_scanned("+blah",
                   :tUPLUS,      "+",    [0, 1],
                   :tIDENTIFIER, "blah", [1, 5])
  end

  def test_if_unless_mod
    assert_scanned("return if true unless false",
                   :kRETURN,      "return", [0, 6],
                   :kIF_MOD,      "if",     [7, 9],
                   :kTRUE,        "true",   [10, 14],
                   :kUNLESS_MOD,  "unless", [15, 21],
                   :kFALSE,       "false",  [22, 27])
  end

  def test_if_stmt
    assert_scanned("if true\n return end",
                   :kIF,          "if",     [0, 2],
                   :kTRUE,        "true",   [3, 7],
                   :tNL,          nil,      [7, 8],
                   :kRETURN,      "return", [9, 15],
                   :kEND,         "end",    [16, 19])
  end

  def test_sclass_label
    setup_lexer 20
    assert_scanned("class << a:b",
                   :kCLASS,      'class', [0, 5],
                   :tLSHFT,      '<<',    [6, 8],
                   :tIDENTIFIER, 'a',     [9, 10],
                   :tSYMBOL,     'b',     [10, 12])
  end

  def test_fname_pct_s__22
    setup_lexer 22
    @lex.state = :expr_fname
    assert_scanned("%s(a)",
                   :tPERCENT,    '%', [0, 1],
                   :tIDENTIFIER, 's', [1, 2],
                   :tLPAREN2,    '(', [2, 3],
                   :tIDENTIFIER, 'a', [3, 4],
                   :tRPAREN,     ')', [4, 5])
  end

  def test_fname_pct_s__23
    setup_lexer 23
    @lex.state = :expr_fname
    assert_scanned("%s(a)",
                   :tSYMBEG,         '%s(', [0, 3],
                   :tSTRING_CONTENT, 'a',   [3, 4],
                   :tSTRING_END,     ')',   [4, 5])
  end

  def test_static_env
    env = Parser::StaticEnvironment.new
    env.declare "a"

    @lex.static_env = env
    assert_scanned("a [42]",
                   :tIDENTIFIER, "a", [0, 1],
                   :tLBRACK2,    "[", [2, 3],
                   :tINTEGER,    42,  [3, 5],
                   :tRBRACK,     "]", [5, 6])
  end

  def test_int_suffix
    [18, 19, 20].each do |version|
      setup_lexer version

      assert_scanned("42r",
                     :tINTEGER,    42,  [0, 2],
                     :tIDENTIFIER, 'r', [2, 3])

      assert_scanned("42if",
                     :tINTEGER,    42,   [0, 2],
                     :kIF_MOD,     'if', [2, 4])
    end

    setup_lexer 21

    assert_scanned("42r",  :tRATIONAL,  Rational(42), [0, 3])
    assert_scanned("42i",  :tIMAGINARY, Complex(0, 42), [0, 3])
    assert_scanned("42ri", :tIMAGINARY, Complex(0, Rational(42)), [0, 4])
  end

  def test_float_suffix
    [18, 19, 20].each do |version|
      setup_lexer version

      assert_scanned("42.1r",
                     :tFLOAT,      42.1, [0, 4],
                     :tIDENTIFIER, 'r',  [4, 5])

      assert_scanned("42.1if",
                     :tFLOAT,      42.1, [0, 4],
                     :kIF_MOD,     'if', [4, 6])

      assert_scanned("1e1r",
                     :tFLOAT,      1e1, [0, 3],
                     :tIDENTIFIER, 'r', [3, 4])
    end

    begin
      # Feature-check.
      Rational("10")

      setup_lexer 21

      assert_scanned("42.1r",  :tRATIONAL,  Rational(421, 10), [0, 5])
      assert_scanned("42.1i",  :tIMAGINARY, Complex(0, 42.1), [0, 5])
      assert_scanned("42.1ri", :tIMAGINARY, Complex(0, Rational(421, 10)), [0, 6])
      assert_scanned("42.1ir",
                     :tIMAGINARY,  Complex(0, 42.1), [0, 5],
                     :tIDENTIFIER, 'r',              [5, 6])

      assert_scanned("1e1i",   :tIMAGINARY, Complex(0, 1e1), [0, 4])
      assert_scanned("1e1r",
                     :tFLOAT,      1e1, [0, 3],
                     :tIDENTIFIER, 'r', [3, 4])
      assert_scanned("1e1ri",
                     :tFLOAT,      1e1,  [0, 3],
                     :tIDENTIFIER, 'ri', [3, 5])
      assert_scanned("1e1ir",
                     :tIMAGINARY,  Complex(0, 1e1), [0, 4],
                     :tIDENTIFIER, 'r',             [4, 5])
    rescue NoMethodError
      # Ruby not modern enough
    end
  end

  def test_eof
    assert_scanned("self",
                   :kSELF, "self", [0, 4])
    assert_equal([false, ["$eof", Parser::Source::Range.new(@lex.source_buffer, 4, 4)]],
                 @lex.advance)
  end

  #
  # Test for 'fluent interface'
  #

  def test_fluent_dot
    assert_scanned("x\n.y",
                   :tIDENTIFIER, 'x', [0, 1],
                   :tDOT,        '.', [2, 3],
                   :tIDENTIFIER, 'y', [3, 4])

    assert_scanned("x\n  .y",
                   :tIDENTIFIER, 'x', [0, 1],
                   :tDOT,        '.', [4, 5],
                   :tIDENTIFIER, 'y', [5, 6])

    assert_scanned("x # comment\n  .y",
                   :tIDENTIFIER, 'x', [0, 1],
                   :tDOT,        '.', [14, 15],
                   :tIDENTIFIER, 'y', [15, 16])
  end

  def test_fluent_and_dot
    assert_scanned("x\n&.y",
                   :tIDENTIFIER, 'x',  [0, 1],
                   :tANDDOT,     '&.', [2, 4],
                   :tIDENTIFIER, 'y',  [4, 5])
  end

  #
  # Tests for whitespace.
  #

  def test_whitespace_fname
    @lex.state = :expr_fname
    assert_scanned('class',
                   :kCLASS, 'class', [0, 5])

    @lex.state = :expr_fname
    assert_scanned(' class',
                   :kCLASS, 'class', [1, 6])

    @lex.state = :expr_fname
    assert_scanned("\nclass",
                   :kCLASS, 'class', [1, 6])

    @lex.state = :expr_fname
    assert_scanned("\\\nclass",
                   :kCLASS, 'class', [2, 7])

    @lex.state = :expr_fname
    assert_scanned("#foo\nclass",
                   :kCLASS, 'class', [5, 10])
  end

  def test_whitespace_endfn
    setup_lexer(21)

    @lex.state = :expr_endfn
    assert_scanned('foo:',
                   :tLABEL, 'foo', [0, 4])

    @lex.state = :expr_endfn
    assert_scanned(' foo:',
                   :tLABEL, 'foo', [1, 5])

    @lex.state = :expr_endfn
    assert_scanned("\nfoo:",
                   :tNL,         nil,   [0, 1],
                   :tIDENTIFIER, 'foo', [1, 4],
                   :tCOLON,      ':',   [4, 5])

    @lex.state = :expr_endfn
    assert_scanned("\nfoo: ",
                   :tNL,         nil,   [0, 1],
                   :tIDENTIFIER, 'foo', [1, 4],
                   :tCOLON,      ':',   [4, 5])

    @lex.state = :expr_endfn
    assert_scanned("\\\nfoo:",
                   :tLABEL, 'foo', [2, 6])

    @lex.state = :expr_endfn
    assert_scanned("#foo\nfoo:",
                   :tNL,         nil,   [4, 5],
                   :tIDENTIFIER, 'foo', [5, 8],
                   :tCOLON,      ':',   [8, 9])

    @lex.state = :expr_endfn
    assert_scanned("#foo\nfoo: ",
                   :tNL,         nil,   [4, 5],
                   :tIDENTIFIER, 'foo', [5, 8],
                   :tCOLON,      ':',   [8, 9])
  end

  def test_whitespace_dot
    @lex.state = :expr_dot
    assert_scanned('class',
                   :tIDENTIFIER, 'class', [0, 5])

    @lex.state = :expr_dot
    assert_scanned(' class',
                   :tIDENTIFIER, 'class', [1, 6])

    @lex.state = :expr_dot
    assert_scanned("\nclass",
                   :tIDENTIFIER, 'class', [1, 6])

    @lex.state = :expr_dot
    assert_scanned("\\\nclass",
                   :tIDENTIFIER, 'class', [2, 7])

    @lex.state = :expr_dot
    assert_scanned("#foo\nclass",
                   :tIDENTIFIER, 'class', [5, 10])
  end

  def test_whitespace_arg
    @lex.state = :expr_arg
    assert_scanned('+',
                   :tPLUS,  '+', [0, 1])

    @lex.state = :expr_arg
    assert_scanned(' +',
                   :tUPLUS, '+', [1, 2])

    @lex.state = :expr_arg
    assert_scanned("\n+",
                   :tNL,    nil, [0, 1],
                   :tUPLUS, '+', [1, 2])

    @lex.state = :expr_arg
    assert_scanned("\\\n+",
                   :tUPLUS, '+', [2, 3])

    @lex.state = :expr_arg
    assert_scanned("\\\n +",
                   :tUPLUS, '+', [3, 4])

    @lex.state = :expr_arg
    assert_scanned("#foo\n+",
                   :tNL,    nil, [4, 5],
                   :tUPLUS, '+', [5, 6])
  end

  def test_whitespace_endarg
    @lex.state = :expr_endarg
    assert_scanned('{',
                   :tLBRACE_ARG, '{', [0, 1])

    @lex.state = :expr_endarg
    assert_scanned(' {',
                   :tLBRACE_ARG, '{', [1, 2])

    @lex.state = :expr_endarg
    assert_scanned("\n{",
                   :tNL,         nil, [0, 1],
                   :tLBRACE,     '{', [1, 2])

    @lex.state = :expr_endarg
    assert_scanned("\\\n{",
                   :tLBRACE_ARG, '{', [2, 3])

    @lex.state = :expr_endarg
    assert_scanned("#foo\n{",
                   :tNL,         nil, [4, 5],
                   :tLBRACE,     '{', [5, 6])
  end

  def test_whitespace_mid
    @lex.state = :expr_mid
    assert_scanned('+',
                   :tUPLUS, '+', [0, 1])

    @lex.state = :expr_mid
    assert_scanned(' +',
                   :tUPLUS, '+', [1, 2])

    @lex.state = :expr_mid
    assert_scanned("\n+",
                   :tNL,    nil, [0, 1],
                   :tUPLUS, '+', [1, 2])

    @lex.state = :expr_mid
    assert_scanned("\\\n+",
                   :tUPLUS, '+', [2, 3])

    @lex.state = :expr_mid
    assert_scanned("#foo\n+",
                   :tNL,    nil, [4, 5],
                   :tUPLUS, '+', [5, 6])
  end

  def test_whitespace_beg
    @lex.state = :expr_beg
    assert_scanned('+',
                   :tUPLUS, '+', [0, 1])

    @lex.state = :expr_beg
    assert_scanned(' +',
                   :tUPLUS, '+', [1, 2])

    @lex.state = :expr_beg
    assert_scanned("\n+",
                   :tUPLUS, '+', [1, 2])

    @lex.state = :expr_beg
    assert_scanned("\\\n+",
                   :tUPLUS, '+', [2, 3])

    @lex.state = :expr_beg
    assert_scanned("#foo\n+",
                   :tUPLUS, '+', [5, 6])
  end

  def test_whitespace_value
    setup_lexer(20)

    @lex.state = :expr_value
    assert_scanned('a:b',
                   :tIDENTIFIER, 'a', [0, 1],
                   :tSYMBOL,     'b', [1, 3])

    @lex.state = :expr_value
    assert_scanned(' a:b',
                   :tIDENTIFIER, 'a', [1, 2],
                   :tSYMBOL,     'b', [2, 4])

    @lex.state = :expr_value
    assert_scanned("\na:b",
                   :tIDENTIFIER, 'a', [1, 2],
                   :tSYMBOL,     'b', [2, 4])

    @lex.state = :expr_value
    assert_scanned("\\\na:b",
                   :tIDENTIFIER, 'a', [2, 3],
                   :tSYMBOL,     'b', [3, 5])

    @lex.state = :expr_value
    assert_scanned("#foo\na:b",
                   :tIDENTIFIER, 'a', [5, 6],
                   :tSYMBOL,     'b', [6, 8])
  end

  def test_whitespace_end
    @lex.state = :expr_end
    assert_scanned('+ 1',
                   :tPLUS,    '+', [0, 1],
                   :tINTEGER, 1,   [2, 3])

    @lex.state = :expr_end
    assert_scanned(' + 1',
                   :tPLUS,    '+', [1, 2],
                   :tINTEGER, 1,   [3, 4])

    @lex.state = :expr_end
    assert_scanned("\n+ 1",
                   :tNL,      nil, [0, 1],
                   :tUNARY_NUM, '+', [1, 2],
                   :tINTEGER, 1,   [3, 4])

    @lex.state = :expr_end
    assert_scanned("\\\n+ 1",
                   :tPLUS,    '+', [2, 3],
                   :tINTEGER, 1,   [4, 5])

    @lex.state = :expr_end
    assert_scanned("#foo\n+ 1",
                   :tNL,      nil, [4, 5],
                   :tUNARY_NUM, '+', [5, 6],
                   :tINTEGER, 1,   [7, 8])
  end

  def test_whitespace_cr
    setup_lexer(20)
    assert_scanned("<<E\nfoo\nE\rO",
                   :tSTRING_BEG,     '<<"',   [0, 3],
                   :tSTRING_CONTENT, "foo\n", [4, 8],
                   :tSTRING_END,     'E',     [8, 11],
                   :tNL,             nil,     [3, 4])

    setup_lexer(21)
    refute_scanned("<<E\nfoo\nE\rO",
                   :tSTRING_BEG,     '<<"',   [0, 3],
                   :tSTRING_CONTENT, "foo\n", [4, 8])
  end

  #
  # Handling of encoding-related issues.
  #

  def test_transcoded_source_is_converted_back_to_original_encoding
    setup_lexer(19)
    @lex.force_utf32 = true
    @lex.tokens = []
    assert_scanned(utf('"a" + "b"'),
                   :tSTRING, "a", [0, 3],
                   :tPLUS,   "+", [4, 5],
                   :tSTRING, "b", [6, 9])

    @lex.tokens.each do |_type, (str, _range)|
      assert_equal Encoding::UTF_8, str.encoding
    end
  end

  #
  # Tests for bugs.
  #
  # These tests should be moved from nursery and properly
  # categorized when it's clear how to do that.
  #

  def test_bug_sclass_joined
    assert_scanned("class<<self",
                   :kCLASS, "class", [0, 5],
                   :tLSHFT, "<<",    [5, 7],
                   :kSELF,  "self",  [7, 11])
  end

  def test_bug_const_expr_end
    assert_scanned("Option",
                   :tCONSTANT, 'Option', [0, 6])

    assert_equal :expr_cmdarg, @lex.state
  end

  def test_bug_expr_beg_div
    @lex.state = :expr_beg
    assert_scanned("/=/",
                   :tREGEXP_BEG,     "/", [0, 1],
                   :tSTRING_CONTENT, "=", [1, 2],
                   :tSTRING_END,     "/", [2, 3],
                   :tREGEXP_OPT,     "",  [3, 3])

    @lex.state = :expr_beg
    assert_scanned("/ = /",
                   :tREGEXP_BEG,     "/",   [0, 1],
                   :tSTRING_CONTENT, " = ", [1, 4],
                   :tSTRING_END,     "/",   [4, 5],
                   :tREGEXP_OPT,     "",    [5, 5])
  end

  def test_bug_expr_beg_percent
    @lex.state = :expr_beg
    assert_scanned("%=foo=",
                   :tSTRING_BEG,     "%=",  [0, 2],
                   :tSTRING_CONTENT, 'foo', [2, 5],
                   :tSTRING_END,     "=",   [5, 6])

    @lex.state = :expr_beg
    assert_scanned("% = ",
                   :tSTRING_BEG,     "% ", [0, 2],
                   :tSTRING_CONTENT, '=',  [2, 3],
                   :tSTRING_END,     ' ',  [3, 4])
  end

  def test_bug_expr_beg_document
    @lex.state = :expr_beg
    assert_scanned(" \n=begin\n=end\nend",
                   :kEND,            "end", [14, 17])

  end

  def test_bug_expr_beg_number
    @lex.state = :expr_beg
    assert_scanned("86400_000_000",
                   :tINTEGER,        86400_000_000, [0, 13])
  end

  def test_bug_expr_beg_backspace_nl
    @lex.state = :expr_beg
    assert_scanned("\n/foo/",
                   :tREGEXP_BEG,     "/",   [1, 2],
                   :tSTRING_CONTENT, "foo", [2, 5],
                   :tSTRING_END,     "/",   [5, 6],
                   :tREGEXP_OPT,     "",    [6, 6])
  end

  def test_bug_expr_beg_heredoc
    assert_scanned("<<EOL % [\nfoo\nEOL\n]",
                   :tSTRING_BEG,      '<<"',   [0, 5],
                   :tSTRING_CONTENT,  "foo\n", [10, 14],
                   :tSTRING_END,      'EOL',   [14, 17],
                   :tPERCENT,         '%',     [6, 7],
                   :tLBRACK,          '[',     [8, 9],
                   :tRBRACK,          ']',     [18, 19])
  end

  def test_bug_expr_beg_fid
    assert_scanned("Rainbows!",
                   :tFID, 'Rainbows!', [0, 9])
  end

  def test_bug_expr_beg_rescue_assoc
    assert_scanned("rescue=>",
                   :kRESCUE, 'rescue', [0, 6],
                   :tASSOC,  '=>',     [6, 8])
  end

  def test_bug_expr_arg_percent
    @lex.state = :expr_arg
    assert_scanned("%[",
                   :tPERCENT, "%", [0, 1],
                   :tLBRACK,  "[", [1, 2])

    @lex.state = :expr_arg
    assert_scanned("%=1",
                   :tOP_ASGN,    "%", [0, 2],
                   :tINTEGER,    1,   [2, 3])

    @lex.state = :expr_arg
    assert_scanned(" %[1]",
                   :tSTRING_BEG,     "%[", [1, 3],
                   :tSTRING_CONTENT, '1',  [3, 4],
                   :tSTRING_END,     ']',  [4, 5])

    @lex.state = :expr_arg
    assert_scanned(" %=1=",
                   :tOP_ASGN,    "%", [1, 3],
                   :tINTEGER,    1,   [3, 4],
                   :tEQL,        "=", [4, 5])

    @lex.state = :expr_arg
    assert_scanned(" %\n",
                   :tPERCENT,    '%', [1, 2])
  end

  def test_bug_expr_arg_lt_lt
    @lex.state = :expr_arg
    assert_scanned("<<EOS\nEOS",
                   :tLSHFT,      "<<",  [0, 2],
                   :tCONSTANT,   "EOS", [2, 5],
                   :tNL,         nil,   [5, 6],
                   :tCONSTANT,   "EOS", [6, 9])

    @lex.state = :expr_arg
    assert_scanned(" <<EOS\nEOS",
                   :tSTRING_BEG, "<<\"", [1, 6],
                   :tSTRING_END, "EOS",  [7, 10],
                   :tNL,         nil,    [6, 7])
  end

  def test_bug_expr_arg_slash
    @lex.state = :expr_arg
    assert_scanned("/1",
                   :tDIVIDE,    "/", [0, 1],
                   :tINTEGER,   1,   [1, 2])

    @lex.state = :expr_arg
    assert_scanned("/ 1",
                   :tDIVIDE,    "/", [0, 1],
                   :tINTEGER,   1,   [2, 3])

    @lex.state = :expr_arg
    assert_scanned(" /1/",
                   :tREGEXP_BEG,     "/", [1, 2],
                   :tSTRING_CONTENT, "1", [2, 3],
                   :tSTRING_END,     "/", [3, 4],
                   :tREGEXP_OPT,     "",  [4, 4])

    @lex.state = :expr_arg
    assert_scanned(" / 1",
                   :tDIVIDE,    "/", [1, 2],
                   :tINTEGER,   1,   [3, 4])
  end

  def test_bug_expr_arg_label
    setup_lexer 19

    @lex.state = :expr_arg
    assert_scanned(" unless:",
                   :tLABEL,     'unless', [1, 8])

    @lex.state = :expr_arg
    assert_scanned(" unless: ",
                   :tLABEL,     'unless', [1, 8])
  end

  def test_bug_heredoc_continuation
    @lex.state = :expr_arg
    assert_scanned(" <<EOS\nEOS\nend",
                   :tSTRING_BEG,     "<<\"", [1, 6],
                   :tSTRING_END,     "EOS",  [7, 10],
                   :tNL,             nil,    [6, 7],
                   :kEND,            "end",  [11, 14])
  end

  def test_bug_heredoc_cr_lf
    assert_scanned("<<FIN\r\nfoo\r\nFIN\r\n",
                   :tSTRING_BEG,     "<<\"",  [0, 5],
                   :tSTRING_CONTENT, "foo\n", [6, 10],
                   :tSTRING_END,     "FIN",   [10, 13],
                   :tNL,             nil,     [5, 6])
  end

  def test_bug_eh_symbol_no_newline
    assert_scanned("?\"\nfoo",
                   :tINTEGER,     34,    [0, 2],
                   :tNL,          nil,   [2, 3],
                   :tIDENTIFIER,  "foo", [3, 6])
  end

  def test_bug_expr_arg_newline
    @lex.state = :expr_arg
    assert_scanned("\nfoo",
                   :tNL,          nil,   [0, 1],
                   :tIDENTIFIER,  "foo", [1, 4])

    @lex.state = :expr_arg
    assert_scanned(" \nfoo",
                   :tNL,          nil,   [1, 2],
                   :tIDENTIFIER,  "foo", [2, 5])

    @lex.state = :expr_arg
    assert_scanned("#foo\nfoo",
                   :tNL,          nil,   [4, 5],
                   :tIDENTIFIER,  "foo", [5, 8])
  end

  def test_bug_expr_arg_comment_newline
    @lex.state = :expr_arg
    assert_scanned(" #\nfoo",
                   :tNL,         nil,   [2, 3],
                   :tIDENTIFIER, 'foo', [3, 6])
  end

  def test_bug_expr_arg_eh_crlf
    @lex.state = :expr_arg
    assert_scanned(" ?\r\n",
                   :tEH,     '?', [1, 2])
  end

  def test_bug_heredoc_backspace_nl
    assert_scanned(" <<'XXX'\nf \\\nXXX\n",
                   :tSTRING_BEG,     "<<'",    [1, 8],
                   :tSTRING_CONTENT, "f \\\n", [9, 13],
                   :tSTRING_END,     "XXX",    [13, 16],
                   :tNL,             nil,      [8, 9])
  end

  def test_bug_heredoc_lshft
    assert_scanned("<<RULES << CLEANINGS\nRULES",
                   :tSTRING_BEG, '<<"',       [0, 7],
                   :tSTRING_END, 'RULES',     [21, 26],
                   :tLSHFT,      '<<',        [8, 10],
                   :tCONSTANT,   'CLEANINGS', [11, 20])
  end

  def test_bug_sclass_comment_lshft_label
    assert_scanned("class # foo\n<< a:b;end",
                   :kCLASS,      'class', [0, 5],
                   :tLSHFT,      '<<',    [12, 14],
                   :tIDENTIFIER, 'a',     [15, 16],
                   :tSYMBOL,     'b',     [16, 18],
                   :tSEMI,       ';',     [18, 19],
                   :kEND,        'end',   [19, 22])
  end

  def test_bug_expr_dot_comment
    assert_scanned("foo. #bar\nbaz",
                   :tIDENTIFIER, 'foo', [0, 3],
                   :tDOT,        '.',   [3, 4],
                   :tIDENTIFIER, 'baz', [10, 13])
  end

  def test_bug_expr_dot_fid
    assert_scanned("foo.S?",
                   :tIDENTIFIER, 'foo', [0, 3],
                   :tDOT,        '.',   [3, 4],
                   :tFID,        'S?',  [4, 6])
  end

  def test_bug_expr_dot_id_eq
    assert_scanned("foo.x= 1",
                   :tIDENTIFIER, 'foo', [0, 3],
                   :tDOT,        '.',   [3, 4],
                   :tIDENTIFIER, 'x',   [4, 5],
                   :tEQL,        '=',   [5, 6],
                   :tINTEGER,    1,     [7, 8])
  end

  def test_bug_expr_dot_fid_mod
    assert_scanned("foo.x!if 1",
                   :tIDENTIFIER, 'foo', [0, 3],
                   :tDOT,        '.',   [3, 4],
                   :tFID,        'x!',  [4, 6],
                   :kIF_MOD,     'if',  [6, 8],
                   :tINTEGER,    1,     [9, 10])
  end

  def test_bug_expr_mid_comment
    assert_scanned("rescue #bar\nprint",
                   :kRESCUE,     'rescue', [0, 6],
                   :tNL,         nil,      [11, 12],
                   :tIDENTIFIER, 'print',  [12, 17])
  end

  def test_bug_expr_mid_bareword
    assert_scanned("begin; rescue rescue1",
                   :kBEGIN,       'begin',   [0, 5],
                   :tSEMI,        ';',       [5, 6],
                   :kRESCUE,      'rescue',  [7, 13],
                   :tIDENTIFIER,  'rescue1', [14, 21])
  end

  def test_bug_expr_value_document
    assert_scanned("1;\n=begin\n=end",
                   :tINTEGER, 1,   [0, 1],
                   :tSEMI,    ';', [1, 2])
  end

  def test_bug_expr_end_colon
    assert_scanned("'foo':'bar'",
                   :tSTRING, 'foo', [0, 5],
                   :tCOLON,  ':',   [5, 6],
                   :tSTRING, 'bar', [6, 11])
  end

  def test_bug_expr_value_rescue_colon2
    @lex.state = :expr_value
    assert_scanned("rescue::Exception",
                   :kRESCUE,    'rescue',    [0, 6],
                   :tCOLON3,    '::',        [6, 8],
                   :tCONSTANT,  'Exception', [8, 17])
  end

  def test_bug_expr_endarg_braces
    assert_scanned("let [] {",
                   :tIDENTIFIER, 'let', [0, 3],
                   :tLBRACK,     '[',   [4, 5],
                   :tRBRACK,     ']',   [5, 6],
                   :tLBRACE_ARG, '{',   [7, 8])
  end

  def test_bug_line_begin_label
    setup_lexer(19)
    assert_scanned("foo:bar",
                   :tIDENTIFIER, 'foo', [0, 3],
                   :tSYMBOL,     'bar', [3, 7])
  end

  def test_bug_interp_expr_value
    assert_scanned('"#{f:a}"',
                   :tSTRING_BEG,  '"',  [0, 1],
                   :tSTRING_DBEG, '#{', [1, 3],
                   :tIDENTIFIER,  'f',  [3, 4],
                   :tSYMBOL,      'a',  [4, 6],
                   :tRCURLY,      '}',  [6, 7],
                   :tSTRING_END,  '"',  [7, 8])
  end

  def test_bug_const_e
    assert_scanned('E10',
                   :tCONSTANT, 'E10', [0, 3])
    assert_scanned('E4U',
                   :tCONSTANT, 'E4U', [0, 3])
  end

  def test_bug_symbol_newline
    assert_scanned(":foo\n",
                   :tSYMBOL, 'foo', [0, 4],
                   :tNL,     nil,   [4, 5])

    assert_scanned(":foo=\n",
                   :tSYMBOL, 'foo=', [0, 5],
                   :tNL,     nil,    [5, 6])
  end

  def test_bug_interleaved_heredoc
    assert_scanned(%Q{<<w; "\nfoo\nw\n"},
                   :tSTRING_BEG,     '<<"',   [0, 3],
                   :tSTRING_CONTENT, "foo\n", [7, 11],
                   :tSTRING_END,     'w',     [11, 12],
                   :tSEMI,           ';',     [3, 4],
                   :tSTRING_BEG,     '"',     [5, 6],
                   :tSTRING_CONTENT, "\n",    [6, 7],
                   :tSTRING_END,     '"',     [13, 14])

    @lex.state = :expr_beg
    assert_scanned(%Q{<<w; %w[\nfoo\nw\n1]},
                   :tSTRING_BEG,     '<<"',   [0, 3],
                   :tSTRING_CONTENT, "foo\n", [9, 13],
                   :tSTRING_END,     'w',     [13, 14],
                   :tSEMI,           ';',     [3, 4],
                   :tQWORDS_BEG,     '%w[',   [5, 8],
                   :tSTRING_CONTENT, "1",     [15, 16],
                   :tSPACE,          nil,     [16, 16],
                   :tSTRING_END,     ']',     [16, 17])

    @lex.state = :expr_beg
    assert_scanned(%Q{<<w; "\#{\nfoo\nw\n}"},
                   :tSTRING_BEG,     '<<"',   [0, 3],
                   :tSTRING_CONTENT, "foo\n", [9, 13],
                   :tSTRING_END,     'w',     [13, 14],
                   :tSEMI,           ';',     [3, 4],
                   :tSTRING_BEG,     '"',     [5, 6],
                   :tSTRING_DBEG,    '#{',    [6, 8],
                   :tRCURLY,         '}',     [15, 16],
                   :tSTRING_END,     '"',     [16, 17])
  end

  def test_bug_fid_char
    setup_lexer(19)
    assert_scanned('eof??a',
                   :tFID,       'eof?', [0, 4],
                   :tCHARACTER, 'a',    [4, 6])
  end

  def test_bug_nonlabel_context__18
    env = Parser::StaticEnvironment.new
    env.declare "a"

    @lex.static_env = env
    assert_scanned("1+a:a",
                   :tINTEGER,    1,   [0, 1],
                   :tPLUS,       '+', [1, 2],
                   :tIDENTIFIER, 'a', [2, 3],
                   :tCOLON,      ':', [3, 4],
                   :tIDENTIFIER, 'a', [4, 5])
  end

  def test_bug_string_percent_newline
    assert_scanned(%Q{%\nfoo\n},
                   :tSTRING_BEG,     "%\n", [0, 2],
                   :tSTRING_CONTENT, 'foo', [2, 5],
                   :tSTRING_END,     "\n",  [5, 6])
  end

  def test_bug_string_percent_zero
    assert_scanned(%Q{%\0foo\0},
                   :tSTRING_BEG,     "%\0", [0, 2],
                   :tSTRING_CONTENT, 'foo', [2, 5],
                   :tSTRING_END,     "\0",  [5, 6])
  end

  def test_bug_string_utf_escape_composition
    assert_scanned(%q{"\xE2\x80\x99"},
                   :tSTRING, "\xE2\x80\x99", [0, 14])

    assert_scanned(utf(%q{"\xE2\x80\x99"}),
                   :tSTRING, utf('’'), [0, 14])
    assert_scanned(utf(%q{"\342\200\231"}),
                   :tSTRING, utf('’'), [0, 14])
    assert_scanned(utf(%q{"\M-b\C-\M-@\C-\M-Y"}),
                   :tSTRING, utf('’'), [0, 20])
  end

  def test_bug_string_utf_escape_noop
    assert_scanned(utf(%q{"\あ"}),
                   :tSTRING, utf("あ"), [0, 4])
  end

  def test_bug_string_non_utf
    assert_scanned(%Q{"caf\xE9"},
                   :tSTRING, "caf\xE9", [0, 6])
    assert_scanned(%Q{"caf\xC3\xA9"},
                   :tSTRING, "caf\xC3\xA9", [0, 7])

    assert_scanned(utf(%q{"café"}),
                   :tSTRING, utf("café"), [0, 6])
  end

  def test_bug_semi__END__
    assert_scanned(%Q{foo;\n__END__},
                   :tIDENTIFIER, 'foo', [0, 3],
                   :tSEMI,       ';',   [3, 4])
  end

  def test_bug_eql_end
    assert_scanned(%Q{=begin\n#=end\n=end})
  end

  def test_bug_hidden_eof
    @lex.state = :expr_beg
    assert_scanned(%Q{"foo\0\x1a\x04bar"},
                   :tSTRING_BEG,     '"',     [0, 1],
                   :tSTRING_CONTENT, "foo\0", [1, 5],
                   :tSTRING_CONTENT, "\x1a",  [5, 6],
                   :tSTRING_CONTENT, "\x04",  [6, 7],
                   :tSTRING_CONTENT, "bar",   [7, 10],
                   :tSTRING_END,     '"',     [10, 11])

    @lex.state = :expr_beg
    assert_scanned(%Q{'foo\0\x1a\x04bar'},
                   :tSTRING_BEG,     "'",     [0, 1],
                   :tSTRING_CONTENT, "foo\0", [1, 5],
                   :tSTRING_CONTENT, "\x1a",  [5, 6],
                   :tSTRING_CONTENT, "\x04",  [6, 7],
                   :tSTRING_CONTENT, "bar",   [7, 10],
                   :tSTRING_END,     "'",     [10, 11])

    @lex.state = :expr_beg
    assert_scanned(%Q{%w[foo\0\x1a\x04bar]},
                   :tQWORDS_BEG,     '%w[',   [0, 3],
                   :tSTRING_CONTENT, "foo\0", [3, 7],
                   :tSTRING_CONTENT, "\x1a",  [7, 8],
                   :tSTRING_CONTENT, "\x04",  [8, 9],
                   :tSTRING_CONTENT, "bar",   [9, 12],
                   :tSPACE,          nil,     [12, 12],
                   :tSTRING_END,     ']',     [12, 13])

    @lex.state = :expr_beg
    assert_scanned(%Q{%W[foo\0\x1a\x04bar]},
                   :tWORDS_BEG,      '%W[',   [0, 3],
                   :tSTRING_CONTENT, "foo\0", [3, 7],
                   :tSTRING_CONTENT, "\x1a",  [7, 8],
                   :tSTRING_CONTENT, "\x04",  [8, 9],
                   :tSTRING_CONTENT, "bar",   [9, 12],
                   :tSPACE,          nil,     [12, 12],
                   :tSTRING_END,     ']',     [12, 13])

    @lex.state = :expr_beg
    assert_scanned(%Q{# foo\0\nbar},
                   :tIDENTIFIER, 'bar', [7, 10])

    @lex.state = :line_begin
    assert_scanned(%Q{=begin\n\0\n=end\nbar},
                   :tIDENTIFIER, 'bar', [14, 17])
  end

  def test_bug_num_adj_kw
    assert_scanned('1if',
                   :tINTEGER, 1,    [0, 1],
                   :kIF_MOD,  'if', [1, 3])

    assert_scanned('1.0if',
                   :tFLOAT,   1.0,  [0, 3],
                   :kIF_MOD,  'if', [3, 5])
  end

  def test_bug_unicode_in_literal
    setup_lexer(19)
    assert_scanned('"\u00a4"',
                   :tSTRING, "\u00a4", [0, 8])
  end

  def test_bug_utf32le_leak
    setup_lexer(19)
    @lex.force_utf32 = true
    assert_scanned('"F0"',
                   :tSTRING, "F0", [0, 4])
  end

  def test_bug_ragel_stack
    assert_scanned("\"\#{$2 ? $2 : 1}\"",
                   :tSTRING_BEG,      "\"",  [0, 1],
                   :tSTRING_DBEG,     "\#{", [1, 3],
                   :tNTH_REF,         2,     [3, 5],
                   :tEH,              "?",   [6, 7],
                   :tNTH_REF,         2,     [8, 10],
                   :tCOLON,           ":",   [11, 12],
                   :tINTEGER,         1,     [13, 14],
                   :tRCURLY,          "}",   [14, 15],
                   :tSTRING_END,      "\"",  [15, 16])
  end

  def test_bug_423
    @lex.state = :expr_beg
    assert_scanned(':&&',
                   :tSYMBEG, ':',  [0, 1],
                   :tANDOP,  '&&', [1, 3])

    @lex.state = :expr_beg
    assert_scanned(':||',
                   :tSYMBEG, ':',  [0, 1],
                   :tOROP,   '||', [1, 3])
  end

  def test_bug_418
    setup_lexer 19

    assert_scanned("{\n=begin\nx: 1,\n=end\ny: 2}",
                   :tLBRACE,  '{', [0, 1],
                   :tLABEL,   'y', [20, 22],
                   :tINTEGER, 2,   [23, 24],
                   :tRCURLY,  '}', [24, 25])
  end

  def test_bug_407
    setup_lexer(21)

    assert_scanned('123if cond',
                   :tINTEGER,    123,    [0, 3],
                   :kIF_MOD,     'if',   [3, 5],
                   :tIDENTIFIER, 'cond', [6, 10])

    assert_scanned('1.23if cond',
                   :tFLOAT,      1.23,   [0, 4],
                   :kIF_MOD,     'if',   [4, 6],
                   :tIDENTIFIER, 'cond', [7, 11])

    assert_scanned('123rescue cond',
                   :tINTEGER,    123,      [0, 3],
                   :kRESCUE_MOD, 'rescue', [3, 9],
                   :tIDENTIFIER, 'cond',   [10, 14])

    assert_scanned('1.23rescue cond',
                   :tFLOAT,      1.23,     [0, 4],
                   :kRESCUE_MOD, 'rescue', [4, 10],
                   :tIDENTIFIER, 'cond',   [11, 15])
  end

  def test_parser_bug_486
    setup_lexer(19)
    assert_scanned(':!@',
                   :tSYMBOL, '!', [0, 3])

    setup_lexer(19)
    assert_scanned(':~@',
                   :tSYMBOL, '~', [0, 3])
  end

  def test_slash_only_in_heredocs
    setup_lexer(23)
    refute_scanned(%Q{<<~E\n\\\nE})

    setup_lexer(23)
    refute_scanned(%Q{<<-E\n\\\nE})
  end

  def test_escapes_in_squiggly_heredoc
    setup_lexer(23)

    assert_scanned(%Q{<<~E\n\a\b\e\f\r\t\\\v\nE},
                   :tSTRING_BEG,     '<<"',              [0, 4],
                   :tSTRING_CONTENT, "\a\b\e\f\r\t\v\n", [5, 14],
                   :tSTRING_END,     'E',                [14, 15],
                   :tNL,             nil,                [4, 5])

    setup_lexer(23)

    assert_scanned(%Q{<<-E\n\a\b\e\f\r\t\\\v\nE},
                   :tSTRING_BEG,     '<<"',              [0, 4],
                   :tSTRING_CONTENT, "\a\b\e\f\r\t\v\n", [5, 14],
                   :tSTRING_END,     'E',                [14, 15],
                   :tNL,             nil,                [4, 5])
  end

  def test_ambiguous_integer_re
    assert_scanned('1re',
                   :tINTEGER, 1, [0, 1],
                   :tIDENTIFIER, 're', [1, 3])
  end

end
