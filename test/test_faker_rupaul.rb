require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerRuPaul < Test::Unit::TestCase
  def setup
    @tester = Faker::RuPaul
  end

  def test_quote
    assert @tester.quote.match(/\w+/i)
  end

  def test_queen
    assert @tester.queen.match(/\w+/i)
  end
end
