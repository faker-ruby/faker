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
    assert_match(/\w+/, @hacker.noun)
  end

  def test_abbreviation
    assert_match(/\w+/, @hacker.abbreviation)
  end

  def test_adjective
    assert_match(/\w+/, @hacker.adjective)
  end

  def test_verb
    assert_match(/\w+/, @hacker.verb)
  end

  def test_ingverb
    assert_match(/\w+/, @hacker.ingverb)
  end
end
