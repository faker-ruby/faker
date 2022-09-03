# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSports < Test::Unit::TestCase
  def setup
    @tester = Faker::Sport
  end

  def test_sport
    assert_match @tester.sport, /\w+/
  end

  def test_sport_with_ancient_allowed
    assert_match @tester.sport(include_ancient: true), /\w+/
  end

  def test_sport_with_unusual_allowed
    assert_match @tester.sport(include_unusual: true), /\w+/
  end

  def test_sport_with_ancient_and_unusual_allowed
    assert_match @tester.sport(include_ancient: true, include_unusual: true), /\w+/
  end

  def test_summer_olympics
    assert_match @tester.summer_olympics_sport, /\w+/
  end

  def test_winter_olympics
    assert_match @tester.winter_olympics_sport, /\w+/
  end

  def test_summer_paralympics
    assert_match @tester.summer_paralympics_sport, /\w+/
  end

  def test_winter_paralympics
    assert_match @tester.winter_paralympics_sport, /\w+/
  end

  def test_unusual_sports
    assert_match @tester.unusual_sport, /\w+/
  end

  def test_ancient_olympics
    assert_match @tester.ancient_olympics_sport, /\w+/
  end
end
