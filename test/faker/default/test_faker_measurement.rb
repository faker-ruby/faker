# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMeasurement < Test::Unit::TestCase
  def setup
    @tester = Faker::Measurement
  end

  def test_height
    assert @tester.height.match?(/\d\s[a-z]/)
  end

  def length
    assert @tester.length(0).match?(/\d\s[a-z]/)
  end

  def volume
    singular_unit = @tester.volume('none')
    plural_unit = @tester.volume('all')
    custom_amount_float = @tester.volume(1.5)
    custom_amount_integer = @tester.volume(276)

    assert singular_unit.match?(/\A\D+[^s]\z/)
    assert plural_unit.match?(/\A\D+[s]\z/)
    assert @tester.volume.match?(/\d\s[a-z]/)
    assert custom_amount_float.match?(/\d\s[a-z]+[s]\z/)
    assert custom_amount_integer.match?(/\d\s[a-z]+[s]\z/)
  end

  def weight
    assert @tester.weight.match?(/\d\s[a-z]/)
  end

  def metric_height
    assert @tester.metric_height.match?(/\d\s[a-z]/)
  end

  def metric_length
    assert @tester.metric_length.match?(/\d\s[a-z]/)
  end

  def metric_volume
    assert @tester.metric_volume.match?(/\d\s[a-z]/)
  end

  def metric_weight
    assert @tester.metric_weight.match?(/\d\s[a-z]/)
    assert @tester.metric_weight(1).match?(/\d\s[a-z]/)
  end

  def test_invalid_amount_error
    amount = 'hello world!'

    assert_raise ArgumentError do
      @tester.volume(amount: amount)
    end
  end
end
