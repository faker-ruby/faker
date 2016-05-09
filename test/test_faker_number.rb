require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')
require 'minitest/mock'

class TestFakerNumber < Test::Unit::TestCase
  def setup
    @tester = Faker::Number
  end

  def test_number
    assert @tester.number(10).match(/[0-9]{10}/)

    10.times do |digits|
      digits += 1
      assert @tester.number(digits).match(/^[0-9]{#{digits}}$/)
    end

    assert @tester.number(10).length == 10
    assert @tester.number(1).length == 1
    assert @tester.number(0) == ""
  end

  def test_decimal
    assert @tester.decimal(2).match(/[0-9]{2}\.[0-9]{2}/)
    assert @tester.decimal(4, 5).match(/[0-9]{4}\.[0-9]{5}/)
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
      random_number = @tester.between(-50, 50)
      assert random_number >= -50, "Expected >= -50, but got #{random_number}"
      assert random_number <=  50, "Expected <= 50, but got #{random_number}"
    end
  end

  def test_positive
    100.times do
      random_number = @tester.positive(1, 100)
      assert random_number >= 1,   "Expected >= 1, but got #{random_number}"
      assert random_number <= 100, "Expected <= 100, but got #{random_number}"
    end
  end

  def test_negative
    100.times do
      random_number = @tester.negative(-1, -100)
      assert random_number <= -1,   "Expected <= -1, but got #{random_number}"
      assert random_number >= -100, "Expected >= -100, but got #{random_number}"
    end
  end

  def test_force_positive
    random_number = @tester.positive(-1, -100)
    assert random_number >= 1,   "Expected >= 1, but got #{random_number}"
    assert random_number <= 100, "Expected <= 100, but got #{random_number}"
  end

  def test_force_negative
    random_number = @tester.negative(1, 100)
    assert random_number <= -1,   "Expected <= -1, but got #{random_number}"
    assert random_number >= -100, "Expected >= -100, but got #{random_number}"
  end

  def test_parameters_order
    random_number = @tester.between(100, 1)
    assert random_number >= 1,   "Expected >= 1, but got #{random_number}"
    assert random_number <= 100, "Expected <= 100, but got #{random_number}"
  end

  def test_hexadecimal
    assert @tester.hexadecimal(4).match(/[0-9a-f]{4}/)
    assert @tester.hexadecimal(7).match(/[0-9a-f]{7}/)
  end

  def test_insignificant_zero
    @tester.stub :digit, 0 do
      assert_equal '0', @tester.number(1)
      100.times do
        assert_match (/^[1-9]0/), @tester.number(2)
      end

      assert_equal '0.0', @tester.decimal(1,1)
      100.times do
        assert_match (/^0\.0[1-9]/), @tester.decimal(1,2)
      end
    end
  end
end
