# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDessert < Test::Unit::TestCase
  def setup
    @tester = Faker::Dessert
  end

  def test_variety
    assert @tester.variety.match?(/\w+/)
  end

  def test_topping
    assert @tester.topping.match?(/\w+/)
  end

  def test_flavor
    assert @tester.flavor.match?(/\w+/)
  end
end
