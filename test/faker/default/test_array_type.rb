# frozen_string_literal: true

require_relative '../../test_helper'

class TestArrayType < Test::Unit::TestCase
  def setup
    @tester = Faker::ArrayType
  end

  def test_integer_zero_integers
    assert_equal 0, @tester.integer(size: 0).count
  end

  def test_integer_five_integers
    assert_equal 5, @tester.integer(size: 5).count
  end

  def test_negative_integer_size
    assert_raises ArgumentError do
      @tester.integer(size: -1)
    end
  end

  def test_random_integer_size
    Faker::Types.stub :rb_integer, 3 do
      assert_equal 3, @tester.integer.count
    end
  end
end
