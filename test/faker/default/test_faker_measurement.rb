# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMeasurement < Test::Unit::TestCase
  def setup
    @tester = Faker::Measurement
  end

  def test_height
    assert_match @tester.height, /\d\s[a-z]/
  end

  def length
    assert_match @tester.length(0), /\d\s[a-z]/
  end

  def volume
    singular_unit = @tester.volume('none')
    plural_unit = @tester.volume('all')
    custom_amount_float = @tester.volume(1.5)
    custom_amount_integer = @tester.volume(276)

    assert_match singular_unit, /\A\D+[^s]\z/
    assert_match plural_unit, /\A\D+s\z/
    assert_match @tester.volume, /\d\s[a-z]/
    assert_match custom_amount_float, /\d\s[a-z]+s\z/
    assert_match custom_amount_integer, /\d\s[a-z]+s\z/
  end

  def weight
    assert_match @tester.weight, /\d\s[a-z]/
  end

  def metric_height
    assert_match @tester.metric_height, /\d\s[a-z]/
  end

  def metric_length
    assert_match @tester.metric_length, /\d\s[a-z]/
  end

  def metric_volume
    assert_match @tester.metric_volume, /\d\s[a-z]/
  end

  def metric_weight
    assert_match @tester.metric_weight, /\d\s[a-z]/
    assert_match @tester.metric_weight(1), /\d\s[a-z]/
  end

  def test_invalid_amount_error
    amount = 'hello world!'

    assert_raise ArgumentError do
      @tester.volume(amount: amount)
    end
  end
end
