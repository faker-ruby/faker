# frozen_string_literal: true

require_relative '../../test_helper'

class TestWorldOfWarcraft < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::WorldOfWarcraft
  end

  def test_heroes
    assert_match(/\w+/, @tester.hero)
  end

  def test_class_names
    assert_match(/\w+/, @tester.class_name)
  end

  def test_races
    assert_match(/\w+/, @tester.race)
  end

  def test_quotes
    assert_match(/\w+/, @tester.quote)
  end
end
