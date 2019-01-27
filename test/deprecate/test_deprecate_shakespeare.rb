# frozen_string_literal: true

require_relative '../test_helper'

class TestDeprecateShakespeare < Test::Unit::TestCase
  def setup
    @tester = Faker::Shakespeare
  end

  def test_as_you_like_it_quote
    assert @tester.as_you_like_it_quote.match(/\w+/)
  end

  def test_king_richard_iii_quote
    assert @tester.king_richard_iii_quote.match(/\w+/)
  end

  def test_romeo_and_juliet_quote
    assert @tester.romeo_and_juliet_quote.match(/\w+/)
  end

  def test_hamlet_quote
    assert @tester.hamlet_quote.match(/\w+/)
  end
end
