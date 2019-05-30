# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTypes < Test::Unit::TestCase
  module TestModule
  end

  def setup
    @tester = Faker::Types
  end

  def test_rb_string_is_or_correct_type
    assert @tester.rb_string.class == String
  end

  def test_string_returns_correct_number_of_words
    assert @tester.rb_string(1).split(' ').length == 1
    assert @tester.rb_string(5).split(' ').length == 5
    assert @tester.rb_string(0).split(' ').empty?
  end

  def test_character
    assert @tester.character.length == 1
  end

  def test_integer
    if RUBY_VERSION < '2.4.0'
      assert @tester.rb_integer.class == Fixnum
    else
      assert @tester.rb_integer.class == Integer
    end
  end

  def test_rb_integer_between
    from = Faker::Number.number.to_i
    to = from + Faker::Number.number.to_i
    val = @tester.rb_integer(from, to)
    assert val < to && val >= from
  end

  def test_rb_hash_returns_a_hash
    assert @tester.rb_hash.class == Hash
  end

  def test_hash_returns_the_correct_number_of_keys
    assert @tester.rb_hash(3).keys.length == 3
    assert @tester.rb_hash(0).keys.empty?
    assert @tester.rb_hash.keys.length == 1
  end

  def test_complex_rb_hash_returns_a_hash
    assert @tester.complex_rb_hash.class == Hash
  end

  def test_complex_hash_returns_the_correct_number_of_keys
    assert @tester.complex_rb_hash(3).keys.length == 3
    assert @tester.complex_rb_hash(0).keys.empty?
    assert @tester.complex_rb_hash.keys.length == 1
  end

  def test_rb_array_returns_array
    assert @tester.rb_array.class == Array
  end

  def test_array_has_the_right_array
    assert @tester.rb_array(3).length == 3
    assert @tester.rb_array(0).empty?
    assert @tester.rb_array.length == 1
  end

  def test_titleize
    val = 'foobar'
    expected = 'Foobar'
    assert @tester.send(:titleize, val) == expected
  end

  def test_resolve
    array = [1, 2, 3]
    range = 1..10
    assert array.include?(@tester.send(:resolve, array))
    assert range.include?(@tester.send(:resolve, range))
  end
end
