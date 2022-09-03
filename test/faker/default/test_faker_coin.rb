# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCoin < Test::Unit::TestCase
  def setup
    @tester = Faker::Coin
  end

  def test_name
    assert_match @tester.name, /\w+/
  end

  def test_flip
    assert_match @tester.flip, /\w+/
  end
end
