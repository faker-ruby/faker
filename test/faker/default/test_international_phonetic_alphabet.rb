# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerInternationalPhoneticAlphabet < Test::Unit::TestCase
  def setup
    @tester = Faker::InternationalPhoneticAlphabet
  end

  def test_one_consonant
    assert_match(/./, @tester.consonant)
  end

  def test_multiple_consonants
    assert_match(/../, @tester.consonant(amount: 2))
    assert_match(/..../, @tester.consonant(amount: 4))
  end

  def test_one_vowel
    assert_match(/./, @tester.vowel)
  end

  def test_multiple_vowels
    assert_match(/../, @tester.vowel(amount: 2))
    assert_match(/..../, @tester.vowel(amount: 4))
  end

  def test_one_character
    assert_match(/./, @tester.character)
  end

  def test_multiple_characters
    assert_match(/../, @tester.character(amount: 2))
    assert_match(/..../, @tester.character(amount: 4))
  end

end