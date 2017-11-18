require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerZelda < Test::Unit::TestCase
  def setup
    @tester = Faker::Zelda
  end

  def test_game
    assert @tester.game.match(/\w+\.?/)
  end

  def test_character
    assert @tester.character.match(/\w+\.?/)
  end

  def test_location
    assert @tester.location.match(/\w+\.?/)
  end

  def test_item
    assert @tester.item.match(/\w+\.?/)
  end
end
