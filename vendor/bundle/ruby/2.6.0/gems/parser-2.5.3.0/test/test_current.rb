# frozen_string_literal: true

require 'helper'
require 'parser/current'

class TestCurrent < Minitest::Test
  def test_current
    case RUBY_VERSION
    when '2.0.0'
      assert_equal Parser::Ruby20, Parser::CurrentRuby
    when /^2\.1\.\d+/
      assert_equal Parser::Ruby21, Parser::CurrentRuby
    when /^2\.2\.\d+/
      assert_equal Parser::Ruby22, Parser::CurrentRuby
    when /^2\.3\.\d+/
      assert_equal Parser::Ruby23, Parser::CurrentRuby
    when /^2\.4\.\d+/
      assert_equal Parser::Ruby24, Parser::CurrentRuby
    when /^2\.5\.\d+/
      assert_equal Parser::Ruby25, Parser::CurrentRuby
    when /^2\.6\.\d+/
      assert_equal Parser::Ruby26, Parser::CurrentRuby
    else
      flunk "Update test_current for #{RUBY_VERSION}"
    end
  end
end
