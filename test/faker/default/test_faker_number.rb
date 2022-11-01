# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/mock'

class TestFakerNumber < Test::Unit::TestCase
  def setup
    @tester = Faker::Number
  end

  def test_leading_zero_number
    assert_match(/^0[0-9]{9}/, @tester.leading_zero_number)
    assert_match(/^0[0-9]{8}/, @tester.leading_zero_number(digits: 9))
  end

  def test_number
    assert_match(/[0-9]{10}/, @tester.number(digits: 10).to_s)

    10.times do |digits|
      digits += 1

      assert_match(/^[0-9]{#{digits}}$/, @tester.number(digits: digits).to_s)
    end

    assert_equal(10, @tester.number(digits: 10).to_s.length)
    assert_equal(1, @tester.number(digits: 1).to_s.length)
  end

  def test_number_with_one_digit
    random_number = 4
    in_range = lambda { |range|
      assert_equal(0..9, range)
      random_number
    }

    Faker::Base.stub(:rand, in_range) do
      assert_equal(random_number, @tester.number(digits: 1))
    end
  end

  def test_decimal
    assert_match(/[0-9]{1}\.[1-9]{1}/, @tester.decimal(l_digits: 1, r_digits: 1).to_s)
    assert_match(/[0-9]{2}\.[0-9]{1}[1-9]{1}/, @tester.decimal(l_digits: 2).to_s)
    assert_match(/[0-9]{4}\.[0-9]{4}[1-9]{1}/, @tester.decimal(l_digits: 4, r_digits: 5).to_s)
  end

  def test_digit
    assert_match(/[0-9]{1}/, @tester.digit.to_s)
    assert_includes((1..1000).collect { |_i| @tester.digit == 9 }, true)
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
    values = Array.new(n) { @tester.normal(mean: 150.0, standard_deviation: 100.0) }
    mean = values.reduce(:+) / n.to_f
    variance = values.inject(0) { |var, value| var + (value - mean)**2 } / (n - 1).to_f
    std_dev = Math.sqrt variance

    assert_in_delta 150.0, mean, 5.0
    assert_in_delta 100.0, std_dev, 3.0
  end

  def test_between
    100.times do
      random_number = @tester.between(from: -50, to: 50)

      assert random_number >= -50, "Expected >= -50, but got #{random_number}"
      assert random_number <=  50, "Expected <= 50, but got #{random_number}"
    end
  end

  def test_within
    100.times do
      random_number = @tester.within(range: -50..50)

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
    assert_match(/[0-9a-f]{4}/, @tester.hexadecimal(digits: 4))
    assert_match(/[0-9a-f]{7}/, @tester.hexadecimal(digits: 7))
  end

  def test_binary
    assert_match(/^[0-1]{4}$/, @tester.binary(digits: 4))
    assert_match(/^[0-1]{8}$/, @tester.binary(digits: 8))
    assert_match(/^[0-1]{4}$/, @tester.binary)
  end
end
