# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/mock'

class TestFakerNumber < Test::Unit::TestCase
  def setup
    @tester = Faker::Number
  end

  def test_number
    assert @tester.number(10).to_s.match(/[0-9]{10}/)

    10.times do |digits|
      digits += 1
      assert @tester.number(digits).to_s.match(/^[0-9]{#{digits}}$/)
    end

    assert @tester.number(10).to_s.length == 10
    assert @tester.number(1).to_s.length == 1
    assert @tester.number(0).nil?
  end

  def test_decimal
    100.times do
      assert @tester.decimal(2).to_s.match(/[1-9][0-9]\.[0-9][1-9]/)
      assert @tester.decimal(4, 5).to_s.match(/[1-9][0-9]{3}\.[0-9]{4}[1-9]/)
    end
  end

  def test_digit
    assert @tester.digit.to_s.match(/[0-9]{1}/)
    assert((1..1000).collect { |_i| @tester.digit == 9 }.include?(true))
  end

  def test_even_distribution
    assert stats = {}
    assert times = 10_000

    times.times do
      assert num = @tester.digit
      stats[num] ||= 0
      assert stats[num] += 1
    end

    stats.each do |_k, v|
      assert_in_delta 10.0, 100.0 * v / times, 2.0
    end
  end

  def test_normal
    n = 10_000
    values = Array.new(n) { @tester.normal(150.0, 100.0) }
    mean = values.reduce(:+) / n.to_f
    variance = values.inject(0) { |var, value| var + (value - mean)**2 } / (n - 1).to_f
    std_dev = Math.sqrt variance

    assert_in_delta 150.0, mean, 5.0
    assert_in_delta 100.0, std_dev, 3.0
  end

  def test_between
    100.times do
      random_number = @tester.between(-50, 50)
      assert random_number >= -50, "Expected >= -50, but got #{random_number}"
      assert random_number <=  50, "Expected <= 50, but got #{random_number}"
    end
  end

  def test_within
    100.times do
      random_number = @tester.within(-50..50)
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
      assert_equal 0, @tester.number(1)
      100.times do
        assert_match(/^[1-9]0/, @tester.number(2).to_s)
      end

      assert_equal 0.0, @tester.decimal(1, 1)
      100.times do
        assert_match(/^0\.[0-9]/, @tester.decimal(1, 2).to_s)
      end
    end
  end
end
