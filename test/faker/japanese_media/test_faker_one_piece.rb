# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseOnePiece < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::OnePiece
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_sea
    assert_match @tester.sea, /\w+/
  end

  def test_island
    assert_match @tester.island, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  def test_akuma_no_mi
    assert_match @tester.akuma_no_mi, /\w+/
  end
end
