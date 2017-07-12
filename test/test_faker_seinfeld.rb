require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSeinfeld < Test::Unit::TestCase

  def setup
    @tester = Faker::Seinfeld
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
