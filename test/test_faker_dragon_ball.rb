require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerDragonBall < Test::Unit::TestCase
  def setup
    @tester = Faker::DragonBall
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end
end
