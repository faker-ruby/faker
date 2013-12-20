require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerNumber < Test::Unit::TestCase

  def setup
    @tester = Faker::Number
  end
  
  def test_number
    assert @tester.number(10).match(/[0-9]{10}/)
  end
  
  def test_digit
    assert @tester.digit.match(/[0-9]{1}/)
  end

  def test_money_returns_float_with_two_digits_after_decimal_point
  	assert @tester.money.to_s.match(/\d+\.\d{2}/)
  end

  def test_money_returns_positive_value
  	assert @tester.money > 0
  end

  def test_money_returns_less_that_thousand
  	assert @tester.money < 1000
  end

  def test_money_uses_from_option
  	assert @tester.money(:from => 100) > 100
  end

  def test_money_uses_to_option
  	assert @tester.money(:to => 100) < 100
  end

end