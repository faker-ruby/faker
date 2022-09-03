# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFallout < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Fallout
  end

  def test_hero
    assert_match @tester.character, /\w+/
  end

  def test_faction
    assert_match @tester.faction, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
