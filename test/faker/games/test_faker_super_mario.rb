# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSuperMario < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::SuperMario
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_game
    assert @tester.game.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end
end
