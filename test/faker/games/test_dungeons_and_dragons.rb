# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDungeonsAndDragons < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::DungeonsAndDragons
  end

  def test_ability
    assert @tester.ability.match(/\w+/)
  end

  # test match for a specific skill
  def test_specific_skill
    assert @tester.skill(ability: 'strength').match('Athletics')
  end

  # test match for a random skill
  def test_random_skill
    assert @tester.skill.match(/\w+/)
  end

  def test_invalid_skill
    assert_raise ArgumentError do
      @tester.skill(ability: 'someinvalidability')
    end
  end

  def test_alignment
    assert @tester.alignment.match(/\w+/)
  end

  def test_armor
    assert @tester.armor.match(/\w+/)
  end

  def test_player_class
    assert @tester.player_class.match(/\w+/)
  end

  # test match for a specific subclass
  def test_specific_subclass
    assert @tester.subclass(player_class: 'rogue').match('Thief')
    assert @tester.subclass(player_class: 'cleric').match('Life Domain')
    assert @tester.subclass(player_class: 'wizard').match('School of Evocation')
  end

  # test match for a random subclass
  def test_random_subclass
    assert @tester.subclass.match(/\w+/)
  end

  def test_invalid_subclass
    assert_raise ArgumentError do
      @tester.subclass(player_class: 'jedi')
    end
  end

  def test_language
    assert @tester.language.match(/\w+/)
  end

  def test_monster
    assert @tester.monster.match(/\w+/)
  end

  def test_race
    assert @tester.race.match(/\w+/)
  end

  def test_specific_subrace
    assert @tester.subrace(race: 'dwarf').match('Hill Dwarf')
    assert @tester.subrace(race: 'elf').match('High Elf')
    assert @tester.subrace(race: 'gnome').match('Rock Gnome')
  end

  def test_random_subrace
    assert @tester.subrace.match(/\w+/)
  end

  def test_invalid_subrace
    assert_raise ArgumentError do
      @tester.subrace(race: 'wookiee')
    end
  end

  def test_size
    assert @tester.size.match(/\w+/)
  end

  def test_spell
    assert @tester.spell.match(/\w+/)
  end

  def test_magic_school
    assert @tester.magic_school.match(/\w+/)
  end

  def test_weapon
    assert @tester.weapon.match(/\w+/)
  end
end
