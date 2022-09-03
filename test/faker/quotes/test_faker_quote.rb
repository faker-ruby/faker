# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerYoda < Test::Unit::TestCase
  def setup
    @tester = Faker::Quote
  end

  def test_famous_last_words
    assert_match @tester.famous_last_words, /\w+/
  end

  def test_jack_handey
    assert_match @tester.jack_handey, /\w+/
  end

  def test_matz
    assert_match @tester.matz, /\w+/
  end

  def test_most_interesting_man_in_the_world
    assert_match @tester.most_interesting_man_in_the_world, /\w+/
  end

  def test_robin
    assert_match @tester.robin, /\w+/
  end

  def test_singular_siegler
    assert_match @tester.singular_siegler, /\w+/
  end

  def test_yoda
    assert_match @tester.yoda, /\w+/
  end

  def test_fortune_cookie
    assert_match @tester.fortune_cookie, /\w+/
  end
end
