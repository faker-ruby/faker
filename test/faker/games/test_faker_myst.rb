# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMyst < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Myst
  end

  def test_game
    assert_match @tester.game, /\w+/
  end

  def test_creature
    assert_match @tester.creature, /\w+/
  end

  def test_age
    assert_match @tester.age, /\w+/
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
