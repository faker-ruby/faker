# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerYoda < Test::Unit::TestCase
  def setup
    @tester = Faker::Quote
  end

  def test_famous_last_words
    assert_match(/\w+/, @tester.famous_last_words)
  end

  def test_jack_handey
    assert_match(/\w+/, @tester.jack_handey)
  end

  def test_matz
    assert_match(/\w+/, @tester.matz)
  end

  def test_most_interesting_man_in_the_world
    assert_match(/\w+/, @tester.most_interesting_man_in_the_world)
  end

  def test_robin
    assert_match(/\w+/, @tester.robin)
  end

  def test_singular_siegler
    assert_match(/\w+/, @tester.singular_siegler)
  end

  def test_yoda
    assert_match(/\w+/, @tester.yoda)
  end

  def test_fortune_cookie
    assert_match(/\w+/, @tester.fortune_cookie)
  end
end
