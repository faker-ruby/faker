# frozen_string_literal: true

require 'helper'

class TestDiagnostic < Minitest::Test
  def setup
    @buffer = Parser::Source::Buffer.new('(string)')
    @buffer.source = 'if (this is some bad code + bugs)'

    @range1 = Parser::Source::Range.new(@buffer, 0, 2) # if
    @range2 = Parser::Source::Range.new(@buffer, 4, 8) # this
  end

  def test_verifies_levels
    error = assert_raises ArgumentError do
      Parser::Diagnostic.new(:foobar, :escape_eof, {}, @range1)
    end

    assert_match /level/, error.message
  end

  def test_freezes
    string     = 'foo'.dup
    highlights = [@range2]

    diag = Parser::Diagnostic.new(:error, :escape_eof, @range1, highlights)
    assert diag.frozen?
    assert diag.arguments.frozen?
    assert diag.highlights.frozen?

    refute string.frozen?
    refute highlights.frozen?
  end

  def test_render
    location = Parser::Source::Range.new(@buffer, 26, 27)

    highlights = [
      Parser::Source::Range.new(@buffer, 21, 25),
      Parser::Source::Range.new(@buffer, 28, 32)
    ]

    diag  = Parser::Diagnostic.new(:error, :unexpected, { :character => '+' },
                                   location, highlights)
    assert_equal([
      "(string):1:27: error: unexpected `+'",
      '(string):1: if (this is some bad code + bugs)',
      '(string):1:                      ~~~~ ^ ~~~~ '
    ], diag.render)
  end

  def test_multiline_render
    @buffer = Parser::Source::Buffer.new('(string)')
    @buffer.source = "abc abc abc\ndef def def\nghi ghi ghi\n"

    location = Parser::Source::Range.new(@buffer, 4, 27)

    highlights = [
      Parser::Source::Range.new(@buffer, 0, 3),
      Parser::Source::Range.new(@buffer, 28, 31)
    ]

    diag = Parser::Diagnostic.new(:error, :unexpected_token, { :token => 'ghi' },
                                  location, highlights)

    assert_equal([
      "(string):1:5-3:3: error: unexpected token ghi",
      '(string):1: abc abc abc',
      '(string):1: ~~~ ^~~~~~~...',
      '(string):3: ghi ghi ghi',
      '(string):3: ~~~ ~~~    '
    ], diag.render)
  end

  def test_bug_error_on_newline
    # regression test; see GitHub issue 273
    source = <<-CODE
{
  foo: ->() # I forgot my brace
  }
}
    CODE
    @buffer = Parser::Source::Buffer.new('(string)')
    @buffer.source = source

    location = Parser::Source::Range.new(@buffer, 33, 34)
    diag = Parser::Diagnostic.new(:error, :unexpected_token, { :token => 'tNL' },
                                  location)

    assert_equal([
      '(string):2:32: error: unexpected token tNL',
      '(string):2:   foo: ->() # I forgot my brace',
      '(string):2:                                ^'
    ], diag.render)
  end
end
