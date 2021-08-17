# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDnD < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::DnD
  end

  def test_alignment
    assert @tester.alignment.match(/\w+/)
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

  def test_ranged_weapon
    assert @tester.ranged_weapon.match(/\w+/)
  end
end
