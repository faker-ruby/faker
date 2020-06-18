# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerYoda < Test::Unit::TestCase
  def setup
    @tester = Faker::Quote
  end

  def test_famous_last_words
    assert @tester.famous_last_words.match?(/\w+/)
  end

  def test_matz
    assert @tester.matz.match?(/\w+/)
  end

  def test_most_interesting_man_in_the_world
    assert @tester.most_interesting_man_in_the_world.match?(/\w+/)
  end

  def test_robin
    assert @tester.robin.match?(/\w+/)
  end

  def test_singular_siegler
    assert @tester.singular_siegler.match?(/\w+/)
  end

  def test_yoda
    assert @tester.yoda.match?(/\w+/)
  end
end
