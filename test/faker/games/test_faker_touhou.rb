# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTouhou < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Touhou
  end

  def test_game
    assert_match @tester.game, /\w+\.?/
  end

  def test_character
    assert_match @tester.character, /\w+\.?/
  end

  def test_location
    assert_match @tester.location, /\w+\.?/
  end

  def test_spell_card
    assert_match @tester.spell_card, /\w+\.?/
  end

  def test_song
    assert_match @tester.song, /\w+\.?/
  end
end
