# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerElderScrolls < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::ElderScrolls
  end

  def test_race
    assert_match(/\w+/, @tester.race)
  end

  def test_region
    assert_match(/\w+/, @tester.region)
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end

  def test_dragon
    assert_match(/\w+/, @tester.dragon)
  end

  def test_creature
    assert_match(/\w+/, @tester.creature)
  end

  def test_name
    assert_match(/\w+/, @tester.name)
  end

  def test_first_name
    assert_match(/\w+/, @tester.first_name)
  end

  def test_last_name
    assert_match(/\w+/, @tester.last_name)
  end

  def test_weapon
    assert_match(/\w+/, @tester.weapon)
  end

  def jewelry
    assert_match(/\w+/, @tester.jewelry)
  end
end
