# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMilitary < Test::Unit::TestCase
  def setup
    @tester = Faker::Military
  end

  def test_army_rank
    assert_match @tester.army_rank, /\w/
  end

  def test_marines_rank
    assert_match @tester.marines_rank, /\w/
  end

  def test_navy_rank
    assert_match @tester.navy_rank, /\w/
  end

  def test_air_force_rank
    assert_match @tester.air_force_rank, /\w/
  end

  def test_space_force_rank
    assert_match @tester.space_force_rank, /\w/
  end

  def test_coast_guard_rank
    assert_match @tester.coast_guard_rank, /\w/
  end

  def test_dod_paygrade
    assert_match @tester.dod_paygrade, /\w/
  end
end
