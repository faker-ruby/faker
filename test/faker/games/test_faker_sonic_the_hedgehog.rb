# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGamesSonicTheHedgehog < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::SonicTheHedgehog
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_zone
    assert_match @tester.zone, /\w+/
  end

  def test_game
    assert_match @tester.game, /\w+/
  end
end
