require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class MostInterestingManInTheWorld < Test::Unit::TestCase
  def setup
    @tester = Faker::MostInterestingManInTheWorld
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
