# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerEsport < Test::Unit::TestCase
  def setup
    @tester = Faker::Esport
  end

  def test_team
    assert_match @tester.team, /\w+/
  end

  def test_league
    assert_match @tester.league, /\w+/
  end

  def test_game
    assert_match @tester.game, /\w+/
  end

  def test_player
    assert_match @tester.player, /\w+/
  end

  def test_event
    assert_match @tester.event, /\w+/
  end
end
