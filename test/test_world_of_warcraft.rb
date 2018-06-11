require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestWorldOfWarcraft < Test::Unit::TestCase
  def setup
    @tester = Faker::WorldOfWarcraft
  end

  def test_heroes
    assert @tester.hero.match(/\w+/)
  end

  def test_quotes
    assert @tester.quote.match(/\w+/)
  end
end
