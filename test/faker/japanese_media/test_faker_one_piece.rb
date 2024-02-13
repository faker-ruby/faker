# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseOnePiece < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::OnePiece
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_sea
    assert_match(/\w+/, @tester.sea)
  end

  def test_island
    assert_match(/\w+/, @tester.island)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_akuma_no_mi
    assert_match(/\w+/, @tester.akuma_no_mi)
  end
end
