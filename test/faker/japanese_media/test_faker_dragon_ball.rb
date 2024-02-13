# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaDragonBall < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::DragonBall
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_race
    assert_match(/\w+/, @tester.race)
  end

  def test_planet
    assert_match(/\w+/, @tester.planet)
  end
end
