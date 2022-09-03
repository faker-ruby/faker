# frozen_string_literal: true

require_relative '../../test_helper'

class TestTheKingkillerChronicle < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::TheKingkillerChronicle
  end

  def test_book
    assert_match @tester.book, /\w+/
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_creature
    assert_match @tester.creature, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end
end
