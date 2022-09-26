# frozen_string_literal: true

require_relative '../../test_helper'

class TestWarhammerFantasy < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::WarhammerFantasy
  end

  def test_heroes
    assert_match(/\w+/, @tester.hero)
  end

  def test_quotes
    assert_match(/\w+/, @tester.quote)
  end

  def test_locations
    assert_match(/\w+/, @tester.location)
  end

  def test_factions
    assert_match(/\w+/, @tester.faction)
  end

  def test_creatures
    assert_match(/\w+/, @tester.creature)
  end
end
