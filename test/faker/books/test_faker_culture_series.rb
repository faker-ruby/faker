# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCultureSeries < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::CultureSeries
  end

  def test_book
    assert_match @tester.book, /\w+/
  end

  def test_culture_ship
    assert_match @tester.culture_ship, /\w+/
  end

  def test_culture_ship_class
    assert_match @tester.culture_ship_class, /\w+/
  end

  def test_culture_ship_abv
    assert_match @tester.culture_ship_class_abv, /\w+/
  end

  def test_civ
    assert_match @tester.civ, /\w+/
  end

  def test_planet
    assert_match @tester.planet, /\w+/
  end
end
