require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSwordArtOnline < Test::Unit::TestCase
  def setup
    @tester = Faker::SwordArtOnline
  end

  def test_real_name
    assert @tester.real_name.match(/\w+\.?/)
  end

  def test_game_name
    assert @tester.game_name.match(/\w+\.?/)
  end

  def test_location
    assert @tester.location.match(/\w+\.?/)
  end

  def test_item
    assert @tester.item.match(/\w+\.?/)
  end
end
