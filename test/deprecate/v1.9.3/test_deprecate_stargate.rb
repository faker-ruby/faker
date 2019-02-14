# frozen_string_literal: true

require_relative '../../test_helper'

class TestDeprecateStargate < Test::Unit::TestCase
  def setup
    @tester = Faker::Stargate
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_planet
    assert @tester.planet.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
