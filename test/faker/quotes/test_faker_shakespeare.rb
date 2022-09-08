# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerShakespeare < Test::Unit::TestCase
  def setup
    @tester = Faker::Quotes::Shakespeare
  end

  def test_as_you_like_it_quote
    assert_match(/\w+/, @tester.as_you_like_it_quote)
  end

  def test_king_richard_iii_quote
    assert_match(/\w+/, @tester.king_richard_iii_quote)
  end

  def test_romeo_and_juliet_quote
    assert_match(/\w+/, @tester.romeo_and_juliet_quote)
  end

  def test_hamlet_quote
    assert_match(/\w+/, @tester.hamlet_quote)
  end
end
