# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSport < Test::Unit::TestCase
  def setup
    @tester = Faker::Sport
  end

  def test_sport
    assert_match(/\w+/, @tester.sport)
  end

  def test_sport_with_ancient_allowed
    assert_match(/\w+/, @tester.sport(include_ancient: true))
  end

  def test_sport_with_unusual_allowed
    assert_match(/\w+/, @tester.sport(include_unusual: true))
  end

  def test_sport_with_ancient_and_unusual_allowed
    assert_match(/\w+/, @tester.sport(include_ancient: true, include_unusual: true))
  end

  def test_summer_olympics
    assert_match(/\w+/, @tester.summer_olympics_sport)
  end

  def test_winter_olympics
    assert_match(/\w+/, @tester.winter_olympics_sport)
  end

  def test_summer_paralympics
    assert_match(/\w+/, @tester.summer_paralympics_sport)
  end

  def test_winter_paralympics
    assert_match(/\w+/, @tester.winter_paralympics_sport)
  end

  def test_unusual_sports
    assert_match(/\w+/, @tester.unusual_sport)
  end

  def test_ancient_olympics
    assert_match(/\w+/, @tester.ancient_olympics_sport)
  end
end
