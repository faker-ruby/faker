# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTouhou < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Touhou
  end

  def test_game
    assert_match(/\w+\.?/, @tester.game)
  end

  def test_character
    assert_match(/\w+\.?/, @tester.character)
  end

  def test_location
    assert_match(/\w+\.?/, @tester.location)
  end

  def test_spell_card
    assert_match(/\w+\.?/, @tester.spell_card)
  end

  def test_song
    assert_match(/\w+\.?/, @tester.song)
  end
end
