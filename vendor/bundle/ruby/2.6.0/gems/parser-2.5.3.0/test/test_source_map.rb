# frozen_string_literal: true

require 'helper'
require 'parse_helper'

class TestSourceMap < Minitest::Test
  include ParseHelper

  def test_to_hash
    buf = Parser::Source::Buffer.new("<input>")
    buf.source = "1"
    ast = parser_for_ruby_version('1.8').parse(buf)
    assert_equal [:expression, :operator], ast.loc.to_hash.keys.sort_by(&:to_s)
  end
end
