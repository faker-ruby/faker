# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCultureSeries < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::CultureSeries
  end

  def test_book
    assert_match(/\w+/, @tester.book)
  end

  def test_culture_ship
    assert_match(/\w+/, @tester.culture_ship)
  end

  def test_culture_ship_class
    assert_match(/\w+/, @tester.culture_ship_class)
  end

  def test_culture_ship_abv
    assert_match(/\w+/, @tester.culture_ship_class_abv)
  end

  def test_civ
    assert_match(/\w+/, @tester.civ)
  end

  def test_planet
    assert_match(/\w+/, @tester.planet)
  end
end
