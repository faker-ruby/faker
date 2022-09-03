# frozen_string_literal: true

require_relative '../../test_helper'

class TestWorldOfWarcraft < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::WorldOfWarcraft
  end

  def test_heroes
    assert_match @tester.hero, /\w+/
  end

  def test_class_names
    assert_match @tester.class_name, /\w+/
  end

  def test_races
    assert_match @tester.race, /\w+/
  end

  def test_quotes
    assert_match @tester.quote, /\w+/
  end
end
