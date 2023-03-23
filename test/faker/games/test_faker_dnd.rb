# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDnD < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::DnD
  end

  def test_alignment
    assert_match(/\w+/, @tester.alignment)
  end

  def test_background
    assert_match(/\w+/, @tester.background)
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end

  def test_first_name
    assert_match(/\w+/, @tester.first_name)
  end

  def test_klass
    assert_match(/\w+/, @tester.klass)
  end

  def test_language
    assert_match(/\w+/, @tester.language)
  end

  def test_last_name
    assert_match(/\w+/, @tester.last_name)
  end

  def test_melee_weapon
    assert_match(/\w+/, @tester.melee_weapon)
  end

  def test_monster
    assert_match(/\w+/, @tester.monster)
  end

  def test_name
    assert_match(/\w+/, @tester.name)
  end

  def test_race
    assert_match(/\w+/, @tester.race)
  end

  def test_ranged_weapon
    assert_match(/\w+/, @tester.ranged_weapon)
  end

  def test_title_name
    assert_match(/\w+/, @tester.title_name)
  end
end
