require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerTypes < Test::Unit::TestCase
  module TestModule
  end

  def setup
    @tester = Faker::Types
  end

  def test_string_is_or_correct_type
    assert @tester.string.class == String
  end

  def test_string_returns_correct_number_of_words
    assert @tester.string(1).split(' ').length == 1
    assert @tester.string(5).split(' ').length == 5
    assert @tester.string(0).split(' ').empty?
  end

  def test_character
    assert @tester.character.length == 1
  end

  def test_integer
    if RUBY_VERSION < '2.4.0'
      assert @tester.integer.class == Fixnum
    else
      assert @tester.integer.class == Integer
    end
  end

  def test_integer_between
    from = Faker::Number.number.to_i
    to = from + Faker::Number.number.to_i
    val = @tester.integer(from, to)
    assert val < to && val >= from
  end

  def test_hash_returns_a_hash
    assert @tester.hash.class == Hash
  end

  def test_hash_returns_the_correct_number_of_keys
    assert @tester.hash(3).keys.length == 3
    assert @tester.hash(0).keys.empty?
    assert @tester.hash.keys.length == 1
  end

  def test_complex_hash_returns_a_hash
    assert @tester.complex_hash.class == Hash
  end

  def test_complex_hash_returns_the_correct_number_of_keys
    assert @tester.complex_hash(3).keys.length == 3
    assert @tester.complex_hash(0).keys.empty?
    assert @tester.complex_hash.keys.length == 1
  end

  def test_array_returns_array
    assert @tester.array.class == Array
  end

  def test_array_has_the_right_array
    assert @tester.array(3).length == 3
    assert @tester.array(0).empty?
    assert @tester.array.length == 1
  end

  def test_titleize
    val = 'foobar'
    expected = 'Foobar'
    assert @tester.send(:titleize, val) == expected
  end
end
