
require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerOnePiece < Test::Unit::TestCase
  def setup
    @tester = Faker::OnePiece
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_sea
    assert @tester.sea.match(/\w+/)
  end

  def test_island
    assert @tester.island.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_akuma_no_mi
    assert @tester.akuma_no_mi.match(/\w+/)
  end
end
