# frozen_string_literal: true

require_relative '../../test_helper'

# when these tests are run under Ruby 1.8.7, they will use the
# self-defined Array#sample method in lib/extensions/array and will test whether it
# behaves as the built-in Array#sample method from Ruby 1.9 or greater.
# Under Ruby 1.9, they simply use the built-in Array#sample method
class TestArraySampleMethodCompatibility < Test::Unit::TestCase
  def test_returns_nil_or_empty_array_with_empty_source
    source = []

    result = source.sample

    assert_nil result

    result = source.sample(1)

    assert_empty(result)
  end

  def test_returns_one_array_elem_without_param
    source = %w[foo bar]
    result = source.sample

    assert_includes source, result
  end

  def test_returns_empty_array_with_param_zero
    source = %w[foo bar]
    result = source.sample(0)

    assert_empty(result)
  end

  def test_returns_an_array_with_integer_param
    source = %w[foo bar baz]
    result = source.sample(2)

    assert_kind_of Array, result
    assert_equal(2, result.length)
    assert_empty(result - source)
  end

  def test_returns_source_array_with_integer_param_equal_or_bigger_than_source_length
    source = %w[foo bar]
    result = source.sample(2)

    assert_kind_of Array, result
    assert_predicate(source.sort <=> result.sort, :zero?)

    result = source.sample(3)

    assert_kind_of Array, result
    assert_predicate(source.sort <=> result.sort, :zero?)
  end

  def test_raises_argument_error_with_negative_param
    source = %w[foo bar]
    assert_raise ArgumentError do
      source.sample(-1)
    end
  end
end
