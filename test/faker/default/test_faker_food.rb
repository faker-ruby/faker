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
    assert_match(/\w+/, @tester.dish)
  end

  def test_description
    assert_match(/\w+/, @tester.description)
  end

  def test_ingredient
    assert_match(/\w+/, @tester.ingredient)
  end

  def test_fruits
    assert_match(/\w+/, @tester.fruits)
  end

  def test_vegetables
    assert_match(/\w+/, @tester.vegetables)
  end

  def test_spice
    assert_match(/\w+/, @tester.spice)
  end

  def test_sushi
    assert_match(/\w+/, @tester.sushi)
  end

  def test_measurement
    assert_equal(2, @tester.measurement.split.length)
  end

  def test_metric_measurement
    assert_match(/\w+/, @tester.metric_measurement)
  end

  def test_ethnic_category
    assert_match(/\w+/, @tester.ethnic_category)
  end
end
