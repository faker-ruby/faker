# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerClashOfClans < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::ClashOfClans
  end

  def test_troop
    assert @tester.troop.match(/\w+/)
  end

  def test_rank
    assert @tester.rank.match(/\w+/)
  end

  def test_defensive_building
    assert @tester.defensive_building.match(/\w+/)
  end
end
