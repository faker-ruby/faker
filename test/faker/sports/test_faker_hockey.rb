# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHockey < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports::Hockey
  end

  def test_team
    assert @tester.team.match(/\w+/)
  end

  def test_player
    assert @tester.player.match(/\w+/)
  end

  def test_division
    assert @tester.division.match(/\w+/)
  end

  def test_penalty
    assert @tester.penalty.match(/\w+/)
  end
end
