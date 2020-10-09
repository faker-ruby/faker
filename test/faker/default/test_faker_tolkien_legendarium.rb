# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTolkienLegendarium < Test::Unit::TestCase
  def setup
    @tester = Faker::TolkienLegendarium
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_race
    assert @tester.race.match(/\w+/)
  end

  def test_poem
    assert @tester.poem.match(/\w+/)
  end
end
