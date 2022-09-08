# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerWorldCup < Test::Unit::TestCase
  def setup
    @tester = Faker::WorldCup
  end

  def test_team
    assert_match(/\w+/, @tester.team)
  end

  def test_stadium
    assert_match(/\w+/, @tester.stadium)
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end

  def test_group
    assert_match(/\w+/, @tester.group)
  end

  def test_roster
    assert_match(/\w+/, @tester.roster)
  end
end
