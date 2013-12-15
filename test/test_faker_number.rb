require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerNumber < Test::Unit::TestCase

  def setup
    @tester = Faker::Number
  end
  
  def test_number
    assert @tester.number(9).match(/\A[0-9]{9}\z/)
  end
  
  def test_digit
    assert @tester.digit.match(/[0-9]{1}/)
  end

end
