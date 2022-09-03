# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerZelda < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Zelda
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

  def test_item
    assert_match @tester.item, /\w+\.?/
  end
end
