# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerZelda < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Zelda
  end

  def test_game
    assert @tester.game.match?(/\w+\.?/)
  end

  def test_character
    assert @tester.character.match?(/\w+\.?/)
  end

  def test_location
    assert @tester.location.match?(/\w+\.?/)
  end

  def test_item
    assert @tester.item.match?(/\w+\.?/)
  end
end
