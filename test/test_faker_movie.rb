
require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMovie < Test::Unit::TestCase
  def setup
    @tester = Faker::Movie
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
