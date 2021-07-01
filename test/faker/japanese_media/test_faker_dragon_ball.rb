# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaDragonBall < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::DragonBall
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_race
    assert @tester.race.match(/\w+/)
  end

  def test_planet
    assert @tester.planet.match(/\w+/)
  end
end
