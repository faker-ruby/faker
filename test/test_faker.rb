require File.dirname(__FILE__) + '/test_helper.rb'

class TestFaker < Test::Unit::TestCase

  def test_numerify
    assert Faker::Base.numerify('###').match(/\d{3}/)
  end

  def test_letterify
    letterified = Faker::Base.letterify('???')
    assert letterified.match(/[A-Z]{3}/), "Expected #{letterified} to be <3 uppercase letters>"
  end
end
