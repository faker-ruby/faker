# frozen_string_literal: true

require_relative '../../test_helper'

class TestFinalFantasyXIV < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::FinalFantasyXIV
  end

  def test_characters
    assert_match(/\w+/, @tester.character)
  end

  def test_jobs
    assert_match(/\w+/, @tester.job)
  end

  def test_races
    assert_match(/\w+/, @tester.race)
  end

  def test_data_centers
    assert_match(/\w+/, @tester.data_center)
  end

  def test_zones
    assert_match(/\w+/, @tester.zone)
  end
end
