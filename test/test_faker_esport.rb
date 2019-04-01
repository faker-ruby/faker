require_relative 'test_helper'

class TestFakerEsport < Test::Unit::TestCase
  def setup
    @tester = Faker::Esport
  end

  def test_team
    assert @tester.team.match(/\w+/)
  end

  def test_league
    assert @tester.league.match(/\w+/)
  end

  def test_game
    assert @tester.game.match(/\w+/)
  end

  def test_player
    assert @tester.player.match(/\w+/)
  end

  def test_event
    assert @tester.event.match(/\w+/)
  end
end
