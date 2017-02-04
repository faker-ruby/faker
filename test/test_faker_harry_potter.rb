require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerHarryPotter < Test::Unit::TestCase
  def setup
    @tester = Faker::HarryPotter
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_book
    assert @tester.book.match(/\w+/)
  end
end
