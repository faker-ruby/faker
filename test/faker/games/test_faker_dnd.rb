# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDnD < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::DnD
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

  def test_background
    assert @tester.background.match(/\w+/)
  end

  def test_city
    assert @tester.city.match(/\w+/)
  end

  def test_klass
    assert @tester.klass.match(/\w+/)
  end

  # test match for a specific subclass
  def test_specific_subclass
    assert @tester.subclass(klass: 'bard').match(/College of \w+/)
    assert @tester.subclass(klass: 'barbarian').match(/Path of the \w+/)
  end

  # test match for a random subclass
  def test_random_subclass
    assert @tester.subclass.match(/\w+/)
  end

  def test_invalid_subclass
    assert_raise ArgumentError do
      @tester.subclass(klass: 'jedi')
    end
  end

  def test_language
    assert @tester.language.match(/\w+/)
  end

  def test_melee_weapon
    assert @tester.melee_weapon.match(/\w+/)
  end

  def test_monster
    assert @tester.monster.match(/\w+/)
  end

  def test_race
    assert @tester.race.match(/\w+/)
  end

  def test_specific_subrace
    assert @tester.subrace(race: 'aasimar').match(/\w+ Aasimar/)
    assert @tester.subrace(race: 'gnome').match(/\w+ Gnome/)
  end

  def test_random_subrace
    assert @tester.subrace.match(/\w+/)
  end

  def test_invalid_subrace
    assert_raise ArgumentError do
      @tester.subrace(race: 'wookiee')
    end
  end

  def test_ranged_weapon
    assert @tester.ranged_weapon.match(/\w+/)
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

  def test_magic_item
    assert @tester.magic_item.match(/\w+/)
  end
end
