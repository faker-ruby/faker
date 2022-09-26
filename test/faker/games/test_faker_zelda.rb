# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerZelda < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Zelda
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

  def test_item
    assert_match(/\w+\.?/, @tester.item)
  end
end
