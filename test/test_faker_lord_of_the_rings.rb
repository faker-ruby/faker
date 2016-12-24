require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerLordOfTheRings < Test::Unit::TestCase
  def setup
    @tester = Faker::LordOfTheRings
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end
end