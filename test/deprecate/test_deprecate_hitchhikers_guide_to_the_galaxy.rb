# frozen_string_literal: true

require_relative '../test_helper'

class TestDeprecateHitchhikersGuideToTheGalaxy < Test::Unit::TestCase
  def setup
    @tester = Faker::HitchhikersGuideToTheGalaxy
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_marvin_quote
    assert @tester.marvin_quote.match(/\w+/)
  end

  def test_planet
    assert @tester.planet.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_specie
    assert @tester.specie.match(/\w+/)
  end

  def test_starship
    assert @tester.starship.match(/\w+/)
  end
end
