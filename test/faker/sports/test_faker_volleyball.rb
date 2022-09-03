# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVolleyball < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Volleyball
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

  def test_formation
    assert_match @tester.formation, /\w+/
  end
end
