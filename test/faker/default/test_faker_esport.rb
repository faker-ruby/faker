# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEsport < Test::Unit::TestCase
  def setup
    @tester = Faker::Esport
  end

  def test_team
    assert_match(/\w+/, @tester.team)
  end

  def test_league
    assert_match(/\w+/, @tester.league)
  end

  def test_game
    assert_match(/\w+/, @tester.game)
  end

  def test_player
    assert_match(/\w+/, @tester.player)
  end

  def test_event
    assert_match(/\w+/, @tester.event)
  end
end
