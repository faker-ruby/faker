# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGamesHalfLife < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::HalfLife
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_enemy
    assert_match @tester.enemy, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end
end
