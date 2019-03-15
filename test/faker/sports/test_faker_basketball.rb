# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBasketball < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Basketball
  end

  def test_team
    assert @tester.team.match(/\w+/)
  end

  def test_player
    assert @tester.player.match(/\w+/)
  end

  def test_coach
    assert @tester.coach.match(/\w+/)
  end

  def test_position
    assert @tester.position.match(/\w+/)
  end
end
