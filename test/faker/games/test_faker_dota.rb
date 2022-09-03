# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDota < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Dota
    @heroes = %w[abaddon alchemist axe beastmaster brewmaster bristleback centaur
                 chaos_knight clockwerk doom dragon_knight earth_spirit earthshaker
                 elder_titan huskar io kunkka legion_commander lifestealer lycan
                 magnus night_stalker omniknight phoenix pudge sand_king slardar
                 spirit_breaker sven tidehunter timbersaw tiny treant_protector tusk
                 underlord undying wraith_king]
  end

  def test_building
    assert_match @tester.building, /\w+/
  end

  def test_hero
    assert_match @tester.hero, /\w+/
  end

  def test_item
    assert_match @tester.item, /\w+/
  end

  def test_team
    assert_match @tester.team, /\w+/
  end

  def test_player
    assert_match @tester.player, /\w+/
  end

  def test_heroes_quotes
    @heroes.each do |hero|
      assert_match(/\w+/, @tester.quote(hero: hero))
    end
  end
end
