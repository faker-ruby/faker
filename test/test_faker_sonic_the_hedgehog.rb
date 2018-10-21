# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerGamesSonicTheHedgehog < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::SonicTheHedgehog
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_zone
    assert @tester.zone.match(/\w+/)
  end

  def test_game
    assert @tester.game.match(/\w+/)
  end
end
