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
    assert @tester.building.match(/\w+/)
  end

  def test_hero
    assert @tester.hero.match(/\w+/)
  end

  def test_item
    assert @tester.item.match(/\w+/)
  end

  def test_team
    assert @tester.team.match(/\w+/)
  end

  def test_player
    assert @tester.player.match(/\w+/)
  end

  def test_heroes_quotes
    @heroes.each do |hero|
      assert_match(/\w+/, @tester.quote(hero: hero))
    end
  end

  def test_neutral_item
    assert @tester.neutral_item.match(/\w+/)
  end
end
