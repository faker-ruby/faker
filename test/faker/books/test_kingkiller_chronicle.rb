# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBooksKingkillerChronicle < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::KingkillerChronicle
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_city
    assert @tester.city.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
