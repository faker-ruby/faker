require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestSportsMascots < Test::Unit::TestCase

  def setup
    @tester = Faker::SportsMascots
  end 

  def test_mascot
    assert @tester.mascot.match(/\w+/)
  end
end