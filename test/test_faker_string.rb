# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerString < Test::Unit::TestCase
  def setup
    @tester = Faker::String
  end

  def teardown
    @tester = nil
  end

  def test_is_string
    assert ::String === @tester.random
  end

  def test_has_valid_encoding
    assert @tester.random.valid_encoding?
    128.times { assert @tester.random(1..128).valid_encoding? }
  end

  def test_is_utf8
    assert @tester.random.encoding == Encoding::UTF_8
  end

  def test_default_length
    assert @tester.random.length == 32
  end

  def test_nil_is_zero
    2.times { assert @tester.random(nil).length == 0 }
  end

  def test_int_length
    [0, -1, 1, rand(500), rand(4096)- 2048].each do |len|
      8.times { assert @tester.random(len).length == [0, len].max }
    end
  end

  def test_range_length
    range = (-5..30)
    16.times { assert range.include? @tester.random(range).length }

    range = (42..42)
    assert @tester.random(range).length == 42
  end

  def test_array_length
    array = [0, -1, 1, 1024, rand(2048)]
    8.times { assert array.include? @tester.random(array).length }

    num = rand(4096)- 2048
    array = [num, num, num]
    8.times { assert @tester.random(array).length == [0, num].max }
  end

  def test_nested_lengths
    test = lambda do
      @tester.random([1, (2..5), [3, (-7...6)], nil])
    end
    16.times { assert ((0..5).include? test.call.length) }
  end
end
