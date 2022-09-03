# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHitchhikersGuideToTheGalaxy < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::HitchhikersGuideToTheGalaxy
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_location
    assert_match @tester.location, /\w+/
  end

  def test_marvin_quote
    assert_match @tester.marvin_quote, /\w+/
  end

  def test_planet
    assert_match @tester.planet, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  def test_specie
    assert_match @tester.specie, /\w+/
  end

  def test_starship
    assert_match @tester.starship, /\w+/
  end
end
