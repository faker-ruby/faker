# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaDragonBall < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::DragonBall
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_race
    assert_match @tester.race, /\w+/
  end

  def test_planet
    assert_match @tester.planet, /\w+/
  end
end
