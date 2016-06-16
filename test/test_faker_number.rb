require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')
require 'minitest/mock'

class TestFakerNumber < Test::Unit::TestCase
  def setup
    @tester = Faker::Number
  end

  def test_number
    assert @tester.number(digits: 10).match(/[0-9]{10}/)

    10.times do |digits|
      digits += 1
      assert @tester.number(digits: digits).match(/^[0-9]{#{digits}}$/)
    end

    assert @tester.number(digits: 10).length == 10
    assert @tester.number(digits: 1).length == 1
    assert @tester.number(digits: 0) == ""
  end

  def test_decimal
    assert @tester.decimal(whole_digits: 2).match(/[0-9]{2}\.[0-9]{2}/)
    assert @tester.decimal(whole_digits: 4, decimal_digits: 5).match(/[0-9]{4}\.[0-9]{5}/)
  end

  def test_digit
    assert @tester.digit.match(/[0-9]{1}/)
    assert (1..1000).collect {|i| @tester.digit == "9"}.include?(true)
  end

  def test_even_distribution
    assert stats = {}
    assert times = 10000

    times.times do
      assert num = @tester.digit
      stats[num] ||= 0
      assert stats[num] += 1
    end

    stats.each do |k, v|
      assert_in_delta 10.0, 100.0 * v / times, 2.0
    end
  end

  def test_between
    100.times do
      random_number = @tester.between(from: -50, to: 50)
      assert random_number >= -50, "Expected >= -50, but got #{random_number}"
      assert random_number <=  50, "Expected <= 50, but got #{random_number}"
    end
  end

  def test_positive
    100.times do
      random_number = @tester.positive(from: 1, to: 100)
      assert random_number >= 1,   "Expected >= 1, but got #{random_number}"
      assert random_number <= 100, "Expected <= 100, but got #{random_number}"
    end
  end

  def test_negative
    100.times do
      random_number = @tester.negative(from: -1, to: -100)
      assert random_number <= -1,   "Expected <= -1, but got #{random_number}"
      assert random_number >= -100, "Expected >= -100, but got #{random_number}"
    end
  end

  def test_force_positive
    random_number = @tester.positive(from: -1, to: -100)
    assert random_number >= 1,   "Expected >= 1, but got #{random_number}"
    assert random_number <= 100, "Expected <= 100, but got #{random_number}"
  end

  def test_force_negative
    random_number = @tester.negative(from: 1, to: 100)
    assert random_number <= -1,   "Expected <= -1, but got #{random_number}"
    assert random_number >= -100, "Expected >= -100, but got #{random_number}"
  end

  def test_parameters_order
    random_number = @tester.between(from: 100, to: 1)
    assert random_number >= 1,   "Expected >= 1, but got #{random_number}"
    assert random_number <= 100, "Expected <= 100, but got #{random_number}"
  end

  def test_hexadecimal
    assert @tester.hexadecimal(digits: 4).match(/[0-9a-f]{4}/)
    assert @tester.hexadecimal(digits: 7).match(/[0-9a-f]{7}/)
  end

  def test_insignificant_zero
    @tester.stub :digit, 0 do
      assert_equal '0', @tester.number(digits: 1)
      100.times do
        assert_match (/^[1-9]0/), @tester.number(digits: 2)
      end

      assert_equal '0.0', @tester.decimal(whole_digits: 1, decimal_digits: 1)
      100.times do
        assert_match (/^0\.0[1-9]/), @tester.decimal(whole_digits: 1, decimal_digits: 2)
      end
    end
  end

  def test_missing_required_args
    assert_raise ArgumentError do
      @tester.number
      @tester.leading_zero_number
      @tester.decimal
      @tester.hexadecimal
    end
  end
end
