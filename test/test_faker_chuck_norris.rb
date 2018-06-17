require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerChuckNorris < Test::Unit::TestCase
  def setup
    @tester = Faker::ChuckNorris
  end

  def test_fact
    assert @tester.fact.match(/.*chuck.*/i)
  end
end
