# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerString < Test::Unit::TestCase
  def setup
    @tester = Faker::String
  end

  def teardown
    @tester = nil
  end

  def test_is_string
    assert @tester.random.is_a?(String)
  end

  def test_has_valid_encoding
    assert_predicate @tester.random, :valid_encoding?
    128.times { assert_predicate @tester.random(length: 1..128), :valid_encoding? }
  end

  def test_is_utf8
    assert_equal @tester.random.encoding, Encoding::UTF_8
  end

  def test_default_length
    assert_equal(32, @tester.random.length)
  end

  def test_nil_is_zero
    2.times { assert_empty @tester.random(length: nil) }
  end

  def test_int_length
    [0, -1, 1, rand(500), rand(-2048..2047)].each do |len|
      8.times { assert_equal @tester.random(length: len).length, [0, len].max }
    end
  end

  def test_range_length
    range = (-5..30)
    16.times { assert_includes range, @tester.random(length: range).length }

    range = (42..42)

    assert_equal(42, @tester.random(length: range).length)
  end

  def test_array_length
    array = [0, -1, 1, 1024, rand(2048)]
    8.times { assert_includes array, @tester.random(length: array).length }

    num = rand(-2048..2047)
    array = [num, num, num]
    8.times { assert_equal @tester.random(length: array).length, [0, num].max }
  end

  def test_nested_lengths
    test = lambda do
      @tester.random(length: [1, (2..5), [3, (-7...6)], nil])
    end
    16.times { assert(((0..5).cover? test.call.length)) }
  end
end
