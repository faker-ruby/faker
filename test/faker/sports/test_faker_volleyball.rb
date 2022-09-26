# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVolleyball < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Volleyball
  end

  def test_team
    assert_match(/\w+/, @tester.team)
  end

  def test_player
    assert_match(/\w+/, @tester.player)
  end

  def test_coach
    assert_match(/\w+/, @tester.coach)
  end

  def test_position
    assert_match(/\w+/, @tester.position)
  end

  def test_formation
    assert_match(/\w+/, @tester.formation)
  end
end
