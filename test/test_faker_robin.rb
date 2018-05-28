require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerRobin < Test::Unit::TestCase
  def setup
    @tester = Faker::Robin
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
