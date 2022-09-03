# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVForVendetta < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::VForVendetta
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_speech
    assert_match @tester.speech, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
