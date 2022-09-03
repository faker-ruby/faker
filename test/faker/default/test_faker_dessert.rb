# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDessert < Test::Unit::TestCase
  def setup
    @tester = Faker::Dessert
  end

  def test_variety
    assert_match @tester.variety, /\w+/
  end

  def test_topping
    assert_match @tester.topping, /\w+/
  end

  def test_flavor
    assert_match @tester.flavor, /\w+/
  end
end
