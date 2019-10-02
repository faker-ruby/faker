# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDungeonsAndDragons < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::DungeonsAndDragons
  end

  def test_armor
    assert @tester.armor.match(/\w+/)
  end

  def test_player_class
    assert @tester.player_class.match(/\w+/)
  end

  def test_monster
    assert @tester.monster.match(/\w+/)
  end

  def test_race
    assert @tester.race.match(/\w+/)
  end

  def test_spell
    assert @tester.spell.match(/\w+/)
  end

  def test_weapon
    assert @tester.weapon.match(/\w+/)
  end
end
