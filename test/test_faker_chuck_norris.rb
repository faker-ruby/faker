require_relative 'test_helper'

class TestFakerChuckNorris < Test::Unit::TestCase
  def setup
    @tester = Faker::ChuckNorris
  end

  def test_fact
    assert @tester.fact.match(/.*chuck.*/i)
  end
end
