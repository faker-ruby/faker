# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVForVendetta < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::VForVendetta
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_speech
    assert_match(/\w+/, @tester.speech)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
