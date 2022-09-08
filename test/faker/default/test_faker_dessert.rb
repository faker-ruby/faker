# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDessert < Test::Unit::TestCase
  def setup
    @tester = Faker::Dessert
  end

  def test_variety
    assert_match(/\w+/, @tester.variety)
  end

  def test_topping
    assert_match(/\w+/, @tester.topping)
  end

  def test_flavor
    assert_match(/\w+/, @tester.flavor)
  end
end
