# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStarWars < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::StarWars
  end

  def test_call_sign
    assert_match @tester.call_sign, /\w+/
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_droid
    assert_match @tester.droid, /\w+/
  end

  def test_planet
    assert_match @tester.planet, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end

  # test good match
  def test_random_character_quote
    assert_match @tester.quote(character: 'admiral_ackbar'), /\w+/
  end

  # test good alternate spelling match
  def test_random_character_alt_spelling_quote
    assert_match @tester.quote(character: 'ackbar'), /\w+/
  end

  # test error on no match
  def test_invalid_quote
    assert_raise ArgumentError do
      @tester.quote(character: 'Leto Atreides')
    end
  end

  def test_specie
    assert_match @tester.specie, /\w+/
  end

  def test_vehicle
    assert_match @tester.vehicle, /\w+/
  end

  def test_wookiee_sentence
    assert_match @tester.wookiee_sentence, /\w+/
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
