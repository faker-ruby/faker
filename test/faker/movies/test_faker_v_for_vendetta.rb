# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVForVendetta < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::VForVendetta
  end

  def test_character
    assert @tester.character.match?(/\w+/)
  end

  def test_speech
    assert @tester.speech.match?(/\w+/)
  end

  def test_quote
    assert @tester.quote.match?(/\w+/)
  end
end
