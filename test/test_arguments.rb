require File.dirname(__FILE__) + '/test_helper.rb'

class TestArguments < Test::Unit::TestCase
  def setup
    @names = [
      :a,
      :b,
      :c,
    ]

  end

  def test_converts_when_given_full_args
    expected = {
      a: 1,
      b: nil,
      c: false,
    }
    assert_equal(expected, Faker::Arguments::to_named([1, nil, false], @names))
  end

  def test_converts_when_missing_one_arg
    expected = {
      a: nil,
      b: 'cat',
    }
    assert_equal(expected, Faker::Arguments::to_named([nil, 'cat'], @names))
  end

  def test_converts_when_missing_all_args
    assert_equal({}, Faker::Arguments::to_named([], @names))
  end
end
