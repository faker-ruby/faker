# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStarWars < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::StarWars
  end

  def test_call_sign
    assert @tester.call_sign.match(/\w+/)
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_droid
    assert @tester.droid.match(/\w+/)
  end

  def test_planet
    assert @tester.planet.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  # test good match
  def test_random_character_quote
    assert @tester.quote('admiral_ackbar').match(/\w+/)
  end

  # test good alternate spelling match
  def test_random_character_alt_spelling_quote
    assert @tester.quote('ackbar').match(/\w+/)
  end

  # test error on no match
  def test_invalid_quote
    assert_raise ArgumentError do
      @tester.quote('Leto Atreides')
    end
  end

  def test_specie
    assert @tester.specie.match(/\w+/)
  end

  def test_vehicle
    assert @tester.vehicle.match(/\w+/)
  end

  def test_wookiee_sentence
    assert @tester.wookiee_sentence.match(/\w+/)
  end

  def test_call_numbers
    assert @tester.call_numbers.is_a?(Array)
  end

  def test_call_squadrons
    assert @tester.call_squadrons.is_a?(Array)
  end

  def test_characters
    assert @tester.characters.is_a?(Array)
  end

  def test_droids
    assert @tester.droids.is_a?(Array)
  end

  def test_planets
    assert @tester.planets.is_a?(Array)
  end

  def test_species
    assert @tester.species.is_a?(Array)
  end

  def test_vehicles
    assert @tester.vehicles.is_a?(Array)
  end

  def test_wookiee_words
    assert @tester.wookiee_words.is_a?(Array)
  end
end
