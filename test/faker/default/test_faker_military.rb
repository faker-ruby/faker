# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMilitary < Test::Unit::TestCase
  def setup
    @tester = Faker::Military
  end

  def test_army_rank
    assert @tester.army_rank.match?(/\w/)
  end

  def test_marines_rank
    assert @tester.marines_rank.match?(/\w/)
  end

  def test_navy_rank
    assert @tester.navy_rank.match?(/\w/)
  end

  def test_air_force_rank
    assert @tester.air_force_rank.match?(/\w/)
  end

  def test_dod_paygrade
    assert @tester.dod_paygrade.match?(/\w/)
  end
end
