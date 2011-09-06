require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFaker < Test::Unit::TestCase

  def setup
  end
  
  def test_numerify
    100.times do
      assert Faker::Base.numerify('###').match(/[1-9]\d{2}/)
    end
  end

  def test_letterify
    assert Faker::Base.letterify('???').match(/[A-Z]{3}/)
  end
end
