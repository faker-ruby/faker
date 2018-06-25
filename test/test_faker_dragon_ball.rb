require_relative 'test_helper'

class TestFakerDragonBall < Test::Unit::TestCase
  def setup
    @tester = Faker::DragonBall
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end
end
