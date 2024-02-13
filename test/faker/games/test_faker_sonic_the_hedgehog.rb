# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGamesSonicTheHedgehog < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::SonicTheHedgehog
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_zone
    assert_match(/\w+/, @tester.zone)
  end

  def test_game
    assert_match(/\w+/, @tester.game)
  end
end
