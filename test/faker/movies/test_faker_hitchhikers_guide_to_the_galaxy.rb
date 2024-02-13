# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHitchhikersGuideToTheGalaxy < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::HitchhikersGuideToTheGalaxy
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_marvin_quote
    assert_match(/\w+/, @tester.marvin_quote)
  end

  def test_planet
    assert_match(/\w+/, @tester.planet)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  def test_specie
    assert_match(/\w+/, @tester.specie)
  end

  def test_starship
    assert_match(/\w+/, @tester.starship)
  end
end
