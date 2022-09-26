# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHarryPotter < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::HarryPotter
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_book
    assert_match(/\w+/, @tester.book)
  end

  def test_house
    assert_match(/\w+/, @tester.house)
  end

  def test_spell
    assert_match(/\w+/, @tester.spell)
  end
end
