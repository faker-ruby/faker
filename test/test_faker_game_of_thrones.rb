require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerGameOfThrones < Test::Unit::TestCase
  def setup
    @tester = Faker::GameOfThrones
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_house
    assert @tester.house.match(/\w+/)
  end

  def test_city
    assert @tester.city.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_dragon
    assert @tester.dragon.match(/\w+/)
  end
end
