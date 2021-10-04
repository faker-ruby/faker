# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSports < Test::Unit::TestCase
  def setup
    @tester = Faker::Sport
  end

  def test_sport
    assert @tester.sport.match(/\w+/)
  end

  def test_sport_with_ancient_allowed
    assert @tester.sport(include_ancient: true).match(/\w+/)
  end

  def test_sport_with_unusual_allowed
    assert @tester.sport(include_unusual: true).match(/\w+/)
  end

  def test_sport_with_ancient_and_unusual_allowed
    assert @tester.sport(include_ancient: true, include_unusual: true).match(/\w+/)
  end

  def test_summer_olympics
    assert @tester.summer_olympics_sport.match(/\w+/)
  end

  def test_winter_olympics
    assert @tester.winter_olympics_sport.match(/\w+/)
  end

  def test_summer_paralympics
    assert @tester.summer_paralympics_sport.match(/\w+/)
  end

  def test_winter_paralympics
    assert @tester.winter_paralympics_sport.match(/\w+/)
  end

  def test_unusual_sports
    assert @tester.unusual_sport.match(/\w+/)
  end

  def test_ancient_olympics
    assert @tester.ancient_olympics_sport.match(/\w+/)
  end
end
