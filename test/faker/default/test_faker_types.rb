# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTypes < Test::Unit::TestCase
  module TestModule
  end

  def setup
    @tester = Faker::Types
  end

  def test_rb_string_is_or_correct_type
    assert_instance_of String, @tester.rb_string
  end

  def test_string_returns_correct_number_of_words
    assert_equal(1, @tester.rb_string(words: 1).split.length)
    assert_equal(5, @tester.rb_string(words: 5).split.length)
    assert_empty @tester.rb_string(words: 0).split
  end

  def test_character
    assert_equal(1, @tester.character.length)
  end

  def test_integer
    assert_instance_of Integer, @tester.rb_integer
  end

  def test_rb_integer_between
    from = Faker::Number.number.to_i
    to = from + Faker::Number.number.to_i
    val = @tester.rb_integer(from: from, to: to)
    assert val < to && val >= from
  end

  def test_rb_hash_returns_a_hash
    assert_instance_of Hash, @tester.rb_hash
  end

  def test_hash_returns_the_correct_number_of_keys
    assert_equal(3, @tester.rb_hash(number: 3).keys.length)
    assert @tester.rb_hash(number: 3).values.uniq.length > 1
    assert_empty @tester.rb_hash(number: 0).keys
    assert_equal(1, @tester.rb_hash.keys.length)
  end

  def test_complex_rb_hash_returns_a_hash
    assert_instance_of Hash, @tester.complex_rb_hash
  end

  def test_complex_hash_returns_the_correct_number_of_keys
    assert_equal(3, @tester.complex_rb_hash(number: 3).keys.length)
    assert @tester.complex_rb_hash(number: 3).values.uniq.length > 1
    assert_empty @tester.complex_rb_hash(number: 0).keys
    assert_equal(1, @tester.complex_rb_hash.keys.length)
  end

  def test_rb_array_returns_array
    assert_instance_of Array, @tester.rb_array
  end

  def test_array_has_the_right_array
    assert_equal(3, @tester.rb_array(len: 3).length)
    assert_empty @tester.rb_array(len: 0)
    assert_equal(1, @tester.rb_array.length)
  end

  def test_titleize
    val = 'foobar'
    expected = 'Foobar'
    assert_equal @tester.send(:titleize, val), expected
  end

  def test_resolve
    array = [1, 2, 3]
    range = 1..10
    assert_includes array, @tester.send(:resolve, array)
    assert_includes range, @tester.send(:resolve, range)
  end
end
