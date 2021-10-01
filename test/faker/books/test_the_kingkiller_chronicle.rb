# frozen_string_literal: true

require_relative '../../test_helper'

class TestTheKingkillerChronicle < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::TheKingkillerChronicle
  end

  def test_book
    assert @tester.book.match(/\w+/)
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_creature
    assert @tester.creature.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end
end
