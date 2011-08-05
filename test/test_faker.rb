require File.dirname(__FILE__) + '/test_helper.rb'

class TestFaker < Test::Unit::TestCase

  def test_numerify
    assert Faker::Base.numerify('###').match(/\d{3}/)
  end
end
