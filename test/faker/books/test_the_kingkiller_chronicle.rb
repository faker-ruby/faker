# frozen_string_literal: true

require_relative '../../test_helper'

class TestTheKingkillerChronicle < Test::Unit::TestCase
  def setup
    @tester = Faker::Books::TheKingkillerChronicle
  end

  def test_book
    assert_match(/\w+/, @tester.book)
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_creature
    assert_match(/\w+/, @tester.creature)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end
end
