# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerNatoPhoneticAlphabet < Test::Unit::TestCase
  def setup
    @tester = Faker::NatoPhoneticAlphabet
  end

  def test_code_word
    assert_match(/\w+/, @tester.code_word)
  end
end
