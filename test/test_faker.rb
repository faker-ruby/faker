require File.dirname(__FILE__) + '/test_helper.rb'

class TestFaker < Test::Unit::TestCase

  def setup
  end
  
  def test_numerify
    assert Faker.numerify('###').match(/\d{3}/)
  end
end
