require File.dirname(__FILE__) + '/test_helper.rb'

# when these tests are run under Ruby 1.8.7, they will use the
# self-defined Array#sample method in lib/extensions/array and will test whether it
# behaves as the built-in Array#sample method from Ruby 1.9 or greater.
# Under Ruby 1.9, they simply use the built-in Array#sample method
class TestArraySampleMethodCompatibility < Test::Unit::TestCase

  def test_returns_nil_or_empty_array_with_empty_source
    assert [].sample.nil?
    assert_equal [].sample(1), []
  end

  def test_returns_one_array_elem_without_param
    source = ['foo', 'bar']
    result = ['foo', 'bar'].sample
    assert source.include? result
  end

  def test_returns_empty_array_with_param_zero
    result = ['foo', 'bar'].sample(0)
    assert_equal result, []
  end

  def test_returns_an_array_with_integer_param
    result = ['foo', 'bar', 'baz'].sample(2)
    assert result.is_a? Array
  end

  def test_returns_an_array_with_no_repeated_elems_when_passed_integer
    result = ['foo', 'bar', 'baz'].sample(2)
    assert result.uniq.length == 2
  end

  def test_returns_source_array_with_integer_param_equal_or_bigger_than_source_length
    source = ['foo','bar']
    result = source.sample(2)
    assert (source - result).empty?

    result = source.sample(3)
    assert (source - result).empty?
  end

  def test_raises_argument_error_with_negative_param
    source = ['foo','bar']
    assert_raise ArgumentError do
      source.sample(-1)
    end
  end
end
