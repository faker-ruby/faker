# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerClashOfClans < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::ClashOfClans
  end

  def test_troop
    assert_match @tester.troop, /\w+/
  end

  def test_rank
    assert_match @tester.rank, /\w+/
  end

  def test_defensive_building
    assert_match @tester.defensive_building, /\w+/
  end
end
