# frozen_string_literal: true

require_relative '../../test_helper'

class TestWarhammerFantasy < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::WarhammerFantasy
  end

  def test_heroes
    assert_match @tester.hero, /\w+/
  end

  def test_quotes
    assert_match @tester.quote, /\w+/
  end

  def test_locations
    assert_match @tester.location, /\w+/
  end

  def test_factions
    assert_match @tester.faction, /\w+/
  end

  def test_creatures
    assert_match @tester.creature, /\w+/
  end
end
