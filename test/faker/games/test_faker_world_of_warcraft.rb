# frozen_string_literal: true

require_relative '../../test_helper'

class TestWorldOfWarcraft < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::WorldOfWarcraft
  end

  def test_heroes
    assert @tester.hero.match(/\w+/)
  end

  def test_quotes
    assert @tester.quote.match(/\w+/)
  end
end
