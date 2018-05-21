require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerCommunity < Test::Unit::TestCase
  def setup
    @tester = Faker::Community
  end

  def test_character
    assert @tester.characters.match(/\w/)
  end

  def test_quote
    assert @tester.quotes.match(/\w/)
  end
end
