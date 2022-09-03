# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerElderScrolls < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::ElderScrolls
  end

  def test_race
    assert_match @tester.race, /\w+/
  end

  def test_region
    assert_match @tester.region, /\w+/
  end

  def test_city
    assert_match @tester.city, /\w+/
  end

  def test_dragon
    assert_match @tester.dragon, /\w+/
  end

  def test_creature
    assert_match @tester.creature, /\w+/
  end

  def test_name
    assert_match @tester.name, /\w+/
  end

  def test_first_name
    assert_match @tester.first_name, /\w+/
  end

  def test_last_name
    assert_match @tester.last_name, /\w+/
  end

  def test_weapon
    assert_match @tester.weapon, /\w+/
  end

  def jewelry
    assert_match @tester.jewelry, /\w+/
  end
end
