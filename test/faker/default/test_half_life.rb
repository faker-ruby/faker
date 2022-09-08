# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGamesHalfLife < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::HalfLife
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_enemy
    assert_match(/\w+/, @tester.enemy)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end
end
