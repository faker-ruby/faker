# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerHacker < Test::Unit::TestCase
  def setup
    @hacker = Faker::Hacker
    @phrases = @hacker.phrases
  end

  def test_phrases
    assert @phrases.size == 8
    @phrases.each do |phrase|
      refute phrase.to_s.empty?
    end
  end

  def test_noun
    assert @hacker.noun.match(/\w+/)
  end

  def test_abbreviation
    assert @hacker.abbreviation.match(/\w+/)
  end

  def test_adjective
    assert @hacker.adjective.match(/\w+/)
  end

  def test_verb
    assert @hacker.verb.match(/\w+/)
  end

  def test_ingverb
    assert @hacker.ingverb.match(/\w+/)
  end
end
