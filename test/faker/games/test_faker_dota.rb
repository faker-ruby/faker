# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDota < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Dota
    @heroes = %w[abaddon alchemist ancient_apparition anti_mage arc_warden axe bane batrider beastmaster
                 bloodseeker bounty_hunter brewmaster bristleback broodmother centaur centaur_warrunner
                 chaos_knight chen clinkz clockwerk crystal_maiden dark_seer dark_willow dawnbreaker dazzle
                 death_prophet disruptor doom dragon_knight drow_ranger earth_spirit earthshaker
                 elder_titan huskar io kunkka legion_commander lifestealer lycan magnus meepo night_stalker
                 omniknight phoenix pudge sand_king slardar spirit_breaker sven tidehunter timbersaw tiny
                 treant_protector tusk underlord undying wraith_king]
  end

  def test_building
    assert_match(/\w+/, @tester.building)
  end

  def test_hero
    assert_match(/\w+/, @tester.hero)
  end

  def test_item
    assert_match(/\w+/, @tester.item)
  end

  def test_team
    assert_match(/\w+/, @tester.team)
  end

  def test_player
    assert_match(/[\p{Katakana}\p{Han}\w]+/, @tester.player)
  end

  def test_heroes_quotes
    @heroes.each do |hero|
      assert_match(/\w+/, @tester.quote(hero: hero))
    end
  end
end
