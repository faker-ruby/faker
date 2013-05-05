require File.dirname(__FILE__) + '/test_helper.rb'

# when these tests are run under Ruby 1.8.7, they will use the
# self-defined Array#sample method in lib/extensions/array and will test whether it
# behaves as the built-in Array#sample method from Ruby 1.9 or greater.
# Under Ruby 1.9, they simply use the built-in Array#sample method
class TestArraySampleMethodCompatibility < Test::Unit::TestCase

  def test_returns_nil_or_empty_array_with_empty_source
    source = []

    result = source.sample
    assert result.nil?

    result = source.sample(1)
    assert_equal result, []
  end

  def test_returns_one_array_elem_without_param
    source = ['foo', 'bar']
    result = source.sample
    assert source.include? result
  end

  def test_returns_empty_array_with_param_zero
    source = ['foo', 'bar']
    result = source.sample(0)
    assert_equal result, []
  end

  def test_returns_an_array_with_integer_param
    source = ['foo', 'bar', 'baz']
    result = source.sample(2)
    assert result.is_a? Array
    assert result.length == 2
    assert((result - source).empty?)
  end

  def test_returns_source_array_with_integer_param_equal_or_bigger_than_source_length
    source = ['foo','bar']
    result = source.sample(2)
    assert result.is_a? Array
    assert((source.sort <=> result.sort) == 0)

    result = source.sample(3)
    assert result.is_a? Array
    assert((source.sort <=> result.sort) == 0)
  end

  def test_raises_Argument_Error_with_negative_param
    source = ['foo','bar']
    assert_raise ArgumentError do
      source.sample(-1)
    end
  end
end
