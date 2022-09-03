# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHarryPotter < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::HarryPotter
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  def test_book
    assert_match @tester.book, /\w+/
  end

  def test_house
    assert_match @tester.house, /\w+/
  end

  def test_spell
    assert_match @tester.spell, /\w+/
  end
end
