# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMeasurement < Test::Unit::TestCase
  def setup
    @tester = Faker::Measurement
  end

  def test_height
    assert_match(/\d\s[a-z]/, @tester.height)
  end

  def length
    assert_match(/\d\s[a-z]/, @tester.length(0))
  end

  def volume
    singular_unit = @tester.volume('none')
    plural_unit = @tester.volume('all')
    custom_amount_float = @tester.volume(1.5)
    custom_amount_integer = @tester.volume(276)

    assert_match(/\A\D+[^s]\z/, singular_unit)
    assert_match(/\A\D+s\z/, plural_unit)
    assert_match(/\d\s[a-z]/, @tester.volume)
    assert_match(/\d\s[a-z]+s\z/, custom_amount_float)
    assert_match(/\d\s[a-z]+s\z/, custom_amount_integer)
  end

  def weight
    assert_match(/\d\s[a-z]/, @tester.weight)
  end

  def metric_height
    assert_match(/\d\s[a-z]/, @tester.metric_height)
  end

  def metric_length
    assert_match(/\d\s[a-z]/, @tester.metric_length)
  end

  def metric_volume
    assert_match(/\d\s[a-z]/, @tester.metric_volume)
  end

  def metric_weight
    assert_match(/\d\s[a-z]/, @tester.metric_weight)
    assert_match(/\d\s[a-z]/, @tester.metric_weight(1))
  end

  def test_invalid_amount_error
    amount = 'hello world!'

    assert_raise ArgumentError do
      @tester.volume(amount: amount)
    end
  end
end
