require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerRuPaul < Test::Unit::TestCase

  def setup
    @tester = Faker::RuPaul
  end

  def test_fact
    assert @tester.quote.match(/\w+/i)
  end
end
