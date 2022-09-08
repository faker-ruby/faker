# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMilitary < Test::Unit::TestCase
  def setup
    @tester = Faker::Military
  end

  def test_army_rank
    assert_match(/\w/, @tester.army_rank)
  end

  def test_marines_rank
    assert_match(/\w/, @tester.marines_rank)
  end

  def test_navy_rank
    assert_match(/\w/, @tester.navy_rank)
  end

  def test_air_force_rank
    assert_match(/\w/, @tester.air_force_rank)
  end

  def test_space_force_rank
    assert_match(/\w/, @tester.space_force_rank)
  end

  def test_coast_guard_rank
    assert_match(/\w/, @tester.coast_guard_rank)
  end

  def test_dod_paygrade
    assert_match(/\w/, @tester.dod_paygrade)
  end
end
