# frozen_string_literal: true

require_relative 'test_helper'

class TestDeprecateElderScrolls < Test::Unit::TestCase
  def setup
    @tester = Faker::ElderScrolls
  end

  def test_race
    assert @tester.race.match(/\w+/)
  end

  def test_region
    assert @tester.region.match(/\w+/)
  end

  def test_city
    assert @tester.city.match(/\w+/)
  end

  def test_dragon
    assert @tester.dragon.match(/\w+/)
  end

  def test_creature
    assert @tester.creature.match(/\w+/)
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_first_name
    assert @tester.first_name.match(/\w+/)
  end

  def test_last_name
    assert @tester.last_name.match(/\w+/)
  end
end
