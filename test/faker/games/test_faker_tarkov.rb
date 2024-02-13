# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTarkov < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Tarkov
  end

  # test using assert_match not assert

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_trader
    assert_match(/\w+/, @tester.trader)
  end

  def test_item
    assert_match(/\w+/, @tester.item)
  end

  def test_weapon
    assert_match(/\w+/, @tester.weapon)
  end

  def test_boss
    assert_match(/\w+/, @tester.boss)
  end

  def test_faction
    assert_match(/\w+/, @tester.faction)
  end

  def test_quest
    assert_match(/\w+/, @tester.quest)
  end

  def test_prapor_quest
    assert_match(/\w+/, @tester.prapor_quest)
  end

  def test_therapist_quest
    assert_match(/\w+/, @tester.therapist_quest)
  end

  def test_skier_quest
    assert_match(/\w+/, @tester.skier_quest)
  end

  def test_peacekeeper_quest
    assert_match(/\w+/, @tester.peacekeeper_quest)
  end

  def test_mechanic_quest
    assert_match(/\w+/, @tester.mechanic_quest)
  end

  def test_ragman_quest
    assert_match(/\w+/, @tester.ragman_quest)
  end

  def test_jaeger_quest
    assert_match(/\w+/, @tester.jaeger_quest)
  end

  def test_fence_quest
    assert_match(/\w+/, @tester.fence_quest)
  end
end
