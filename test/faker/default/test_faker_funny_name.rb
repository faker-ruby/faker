# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFunnyName < Test::Unit::TestCase
  def setup
    @tester = Faker::FunnyName
  end

  def test_name
    res = @tester.name

    assert res.is_a?(String) && !res.empty?
  end

  def test_two_word_name
    res = @tester.two_word_name

    assert_equal(1, res.count(' '))
  end

  def test_three_word_name
    res = @tester.three_word_name

    assert_equal(2, res.count(' '))
  end

  def test_four_word_name
    res = @tester.four_word_name

    assert_equal(3, res.count(' '))
  end

  def test_name_with_initial
    res = @tester.name_with_initial

    assert_predicate res.count('.'), :positive?
  end
end
