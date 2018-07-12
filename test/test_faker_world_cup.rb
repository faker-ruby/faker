# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerWorldCup < Test::Unit::TestCase
  def setup
    @tester = Faker::WorldCup
  end

  def test_team
    assert @tester.team.match(/\w+/)
  end

  def test_stadium
    assert @tester.stadium.match(/\w+/)
  end

  def test_city
    assert @tester.city.match(/\w+/)
  end

  def test_group
    assert @tester.group.match(/\w+/)
  end

  def test_roster
    assert @tester.roster.match(/\w+/)
  end
end
