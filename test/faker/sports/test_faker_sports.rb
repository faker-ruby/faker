# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSports < Test::Unit::TestCase
  def setup
    @tester = Faker::Sport
  end

  def test_sport
    assert @tester.sport.match(/\w+/)
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

  def test_modern_olympics
    assert @tester.modern_olympics_sport.match(/\w+/)
  end

  def test_ancient_olympics
    assert @tester.ancient_olympics_sport.match(/\w+/)
  end
end
