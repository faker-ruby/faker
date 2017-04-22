require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestFakerLeagueOfLegends < Test::Unit::TestCase
  def setup
    @tester = Faker::LeagueOfLegends
  end

  def test_champions
    assert @tester.champion.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_quotes
    assert @tester.quote.match(/\w+/)
  end

  def test_quotes
    assert @tester.summoner_spell.match(/\w+/)
  end

  def test_quotes
    assert @tester.masteries.match(/\w+/)
  end

  def test_quotes
    assert @tester.rank.match(/\w+/)
  end
end
