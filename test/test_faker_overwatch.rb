require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerOverwatch < Test::Unit::TestCase
  def setup
    @tester = Faker::Overwatch
  end

  def test_hero
    assert @tester.hero.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
