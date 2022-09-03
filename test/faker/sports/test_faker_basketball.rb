# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBasketball < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Basketball
  end

  def test_team
    assert_match @tester.team, /\w+/
  end

  def test_player
    assert_match @tester.player, /\w+/
  end

  def test_coach
    assert_match @tester.coach, /\w+/
  end

  def test_position
    assert_match @tester.position, /\w+/
  end
end
