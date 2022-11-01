# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAlphanum < Test::Unit::TestCase
  def setup
    @tester = Faker::Alphanumeric
  end

  def alpha
    assert_match(/[a-z]{5}/, @tester.alpha(number: 5))
  end

  def alphanum
    assert_match(/[a-z0-9]{5}/, @tester.alphanumeric(number: 5))
  end

  def test_alphanumeric_invalid_min_alpha
    assert_raise ArgumentError do
      @tester.alphanumeric(number: 5, min_alpha: -1)
    end
  end

  def test_alphanumeric_invalid_min_numeric
    assert_raise ArgumentError do
      @tester.alphanumeric(number: 5, min_numeric: -1)
    end
  end

  def test_alphanumeric_with_invalid_mins
    assert_raise ArgumentError do
      @tester.alphanumeric(number: 5, min_numeric: 4, min_alpha: 3)
    end
  end

  def test_alphanumeric_with_min_alpha
    letters = @tester.alphanumeric(number: 5, min_alpha: 2).chars.map do |char|
      char =~ /[[:alpha:]]/
    end

    assert letters.compact.size >= 2
  end

  def test_alphanumeric_with_min_numeric
    numbers = @tester.alphanumeric(number: 5, min_numeric: 4).chars.map do |char|
      char =~ /[[:digit:]]/
    end

    assert numbers.compact.size >= 4
  end
end
