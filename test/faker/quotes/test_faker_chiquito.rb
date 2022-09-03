# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerChiquito < Test::Unit::TestCase
  def setup
    @tester = Faker::Quotes::Chiquito
  end

  def test_expression
    assert_match @tester.expression, /\w+/
  end

  def test_term
    assert_match @tester.term, /\w+/
  end

  def test_joke
    assert_match @tester.joke, /\w+/
  end

  def test_sentence
    assert_match @tester.sentence, /\w+/
  end
end
