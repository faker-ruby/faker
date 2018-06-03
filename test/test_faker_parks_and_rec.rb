require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerParksAndRec < Test::Unit::TestCase
  def setup
    @tester = Faker::ParksAndRec
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_city
    assert @tester.city.match(/\w+/)
  end
end
