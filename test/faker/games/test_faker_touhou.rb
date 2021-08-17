# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTouhou < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Touhou
  end

  def test_game
    assert @tester.game.match(/\w+\.?/)
  end

  def test_character
    assert @tester.character.match(/\w+\.?/)
  end

  def test_location
    assert @tester.location.match(/\w+\.?/)
  end

  def test_spell_card
    assert @tester.spell_card.match(/\w+\.?/)
  end

  def test_song
    assert @tester.song.match(/\w+\.?/)
  end
end
