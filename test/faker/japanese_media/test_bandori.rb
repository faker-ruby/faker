# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseMediaBandori < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::Bandori
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_band
    assert @tester.band.match(/\w+/)
  end
end
