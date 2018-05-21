require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerAquaTeenHungerForce < Test::Unit::TestCase
  def setup
    @tester = Faker::AquaTeenHungerForce
  end

  def test_character
    assert @tester.character.match(/\w/)
  end
end
