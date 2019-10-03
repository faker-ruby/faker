# frozen_string_literal: true

require_relative '../../test_helper'

class TestWorldOfWarcraft < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::WorldOfWarcraft
  end

  def test_heroes
    assert @tester.hero.match(/\w+/)
  end

  def test_class_names
    assert @tester.class_name.match(/\w+/)
  end

  def test_races
    assert @tester.race.match(/\w+/)
  end

  def test_quotes
    assert @tester.quote.match(/\w+/)
  end
end
