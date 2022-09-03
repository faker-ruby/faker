# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDnD < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::DnD
  end

  def test_alignment
    assert_match @tester.alignment, /\w+/
  end

  def test_background
    assert_match @tester.background, /\w+/
  end

  def test_city
    assert_match @tester.city, /\w+/
  end

  def test_klass
    assert_match @tester.klass, /\w+/
  end

  def test_language
    assert_match @tester.language, /\w+/
  end

  def test_melee_weapon
    assert_match @tester.melee_weapon, /\w+/
  end

  def test_monster
    assert_match @tester.monster, /\w+/
  end

  def test_race
    assert_match @tester.race, /\w+/
  end

  def test_ranged_weapon
    assert_match @tester.ranged_weapon, /\w+/
  end
end
