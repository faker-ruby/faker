# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHacker < Test::Unit::TestCase
  def setup
    @hacker = Faker::Hacker
    @phrases = @hacker.phrases
  end

  def test_phrases
    assert_equal(8, @phrases.size)
    @phrases.each do |phrase|
      refute_empty phrase.to_s
    end
  end

  def test_noun
    assert_match @hacker.noun, /\w+/
  end

  def test_abbreviation
    assert_match @hacker.abbreviation, /\w+/
  end

  def test_adjective
    assert_match @hacker.adjective, /\w+/
  end

  def test_verb
    assert_match @hacker.verb, /\w+/
  end

  def test_ingverb
    assert_match @hacker.ingverb, /\w+/
  end
end
