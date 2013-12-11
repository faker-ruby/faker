require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerNumber < Test::Unit::TestCase

  def setup
    @tester = Faker::Number
  end
  
  def test_number
    assert @tester.number(10).match(/[0-9]{10}/)
    assert @tester.number(10).length == 10
    assert @tester.number(1).length == 1
    assert @tester.number(0) == ""
  end
  
  def test_digit
    assert @tester.digit.match(/[0-9]{1}/)
    assert (1..1000).collect {|i| @tester.digit == "9"}.include?(true)
  end

end