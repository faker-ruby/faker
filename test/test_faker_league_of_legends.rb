require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestFakerLeagueOfLegends < Test::Unit::TestCase
  def setup
    @tester = Faker::LeagueOfLegends
  end

  def test_champions
    assert_match(/\w+/, @tester.champion)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_summoner_spell
    assert_match(/\w+/, @tester.summoner_spell)
  end

  def test_masteries
    assert_match(/\w+/, @tester.masteries)
  end

  def test_rank
    assert_match(/\w+/, @tester.rank)
  end

  def test_lane
    assert_match(/\w+/, @tester.lane)
  end

  def test_champion_role
    assert_match(/\w+/, @tester.champion_role)
  end

  def test_long_lane
    assert_match(/\w+/, @tester.game_role)
  end
end
