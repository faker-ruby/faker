# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFood < Test::Unit::TestCase
  def setup
    @tester = Faker::Food
  end

  def test_flexible_key
    assert_equal(:food, @tester.flexible_key)
  end

  def test_dish
    assert_match @tester.dish, /\w+/
  end

  def test_description
    assert_match @tester.description, /\w+/
  end

  def test_ingredient
    assert_match @tester.ingredient, /\w+/
  end

  def test_fruits
    assert_match @tester.fruits, /\w+/
  end

  def test_vegetables
    assert_match @tester.vegetables, /\w+/
  end

  def test_spice
    assert_match @tester.spice, /\w+/
  end

  def test_sushi
    assert_match @tester.sushi, /\w+/
  end

  def test_measurement
    assert_equal(2, @tester.measurement.split.length)
  end

  def test_metric_measurement
    assert_match @tester.metric_measurement, /\w+/
  end

  def test_ethnic_category
    assert_match @tester.ethnic_category, /\w+/
  end
end
