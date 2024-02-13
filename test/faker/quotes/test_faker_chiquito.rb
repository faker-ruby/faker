# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerChiquito < Test::Unit::TestCase
  def setup
    @tester = Faker::Quotes::Chiquito
  end

  def test_expression
    assert_match(/\w+/, @tester.expression)
  end

  def test_term
    assert_match(/\w+/, @tester.term)
  end

  def test_joke
    assert_match(/\w+/, @tester.joke)
  end

  def test_sentence
    assert_match(/\w+/, @tester.sentence)
  end
end
