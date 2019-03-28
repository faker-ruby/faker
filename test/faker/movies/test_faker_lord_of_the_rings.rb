# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerLordOfTheRings < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::LordOfTheRings
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
