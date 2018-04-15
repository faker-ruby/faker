require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerFootball < Test::Unit::TestCase
  def setup
    @tester = Faker::Football
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

  def test_competition
    assert @tester.competition.match(/\w+/)
  end
end
