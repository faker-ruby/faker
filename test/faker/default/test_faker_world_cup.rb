# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerWorldCup < Test::Unit::TestCase
  def setup
    @tester = Faker::WorldCup
  end

  def test_team
    assert_match @tester.team, /\w+/
  end

  def test_stadium
    assert_match @tester.stadium, /\w+/
  end

  def test_city
    assert_match @tester.city, /\w+/
  end

  def test_group
    assert_match @tester.group, /\w+/
  end

  def test_roster
    assert_match @tester.roster, /\w+/
  end
end
