# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerClashOfClans < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::ClashOfClans
  end

  def test_troop
    assert_match(/\w+/, @tester.troop)
  end

  def test_rank
    assert_match(/\w+/, @tester.rank)
  end

  def test_defensive_building
    assert_match(/\w+/, @tester.defensive_building)
  end
end
