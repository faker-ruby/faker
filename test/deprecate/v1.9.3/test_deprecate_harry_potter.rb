# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateHarryPotter < Test::Unit::TestCase
  def setup
    @tester = Faker::HarryPotter
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

  def test_book
    assert @tester.book.match(/\w+/)
  end

  def test_house
    assert @tester.house.match(/\w+/)
  end

  def test_spell
    assert @tester.spell.match(/\w+/)
  end
end
