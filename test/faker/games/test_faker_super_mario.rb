# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSuperMario < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::SuperMario
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_game
    assert_match(/\w+/, @tester.game)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end
end
