# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCultureSeries < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::CultureSeries
  end

  def test_book
    assert @tester.book.match?(/\w+/)
  end

  def test_culture_ship
    assert @tester.culture_ship.match?(/\w+/)
  end

  def test_culture_ship_class
    assert @tester.culture_ship_class.match?(/\w+/)
  end

  def test_culture_ship_abv
    assert @tester.culture_ship_class_abv.match?(/\w+/)
  end

  def test_civ
    assert @tester.civ.match?(/\w+/)
  end

  def test_planet
    assert @tester.planet.match?(/\w+/)
  end
end
