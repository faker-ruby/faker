# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerInternationalPhoneticAlphabet < Test::Unit::TestCase
  def setup
    @tester = Faker::InternationalPhoneticAlphabet
  end

  def test_one_consonant
    assert_match(/./, @tester.consonant)
  end

  def test_one_vowel
    assert_match(/./, @tester.vowel)
  end

  def test_one_character
    assert_match(/./, @tester.character)
  end

end