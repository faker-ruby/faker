require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerYoda < Test::Unit::TestCase
  def setup
    @tester = Faker::Yoda
  end

  def test_fact
    assert @tester.quote.match(/\w+/)
  end
end
