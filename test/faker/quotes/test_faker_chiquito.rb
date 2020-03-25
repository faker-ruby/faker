# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerChiquito < Test::Unit::TestCase
  def setup
    @tester = Faker::Quotes::Chiquito
  end

  def test_expression
    assert @tester.expression.match(/\w+/)
  end

  def test_term
    assert @tester.term.match(/\w+/)
  end

  def test_joke
    assert @tester.joke.match(/\w+/)
  end

  def test_sentence
    assert @tester.sentence.match(/\w+/)
  end
end
