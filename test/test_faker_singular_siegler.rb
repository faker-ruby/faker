require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSingularSiegler < Test::Unit::TestCase
  
  def setup
    @tester = Faker::SingularSiegler
  end

  def test_quote
    assert @tester.quotes.match(/\w/)
  end

end
