# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerStarWars < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::StarWars
  end

  def test_call_sign
    assert_match(/\w+/, @tester.call_sign)
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_droid
    assert_match(/\w+/, @tester.droid)
  end

  def test_planet
    assert_match(/\w+/, @tester.planet)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  # test good match
  def test_random_character_quote
    assert_match(/\w+/, @tester.quote(character: 'admiral_ackbar'))
  end

  # test good alternate spelling match
  def test_random_character_alt_spelling_quote
    assert_match(/\w+/, @tester.quote(character: 'ackbar'))
  end

  # test error on no match
  def test_invalid_quote
    assert_raise ArgumentError do
      @tester.quote(character: 'Leto Atreides')
    end
  end

  def test_specie
    assert_match(/\w+/, @tester.specie)
  end

  def test_vehicle
    assert_match(/\w+/, @tester.vehicle)
  end

  def test_wookiee_sentence
    assert_match(/\w+/, @tester.wookiee_sentence)
  end

  def test_call_numbers
    assert_kind_of Array, @tester.call_numbers
  end

  def test_call_squadrons
    assert_kind_of Array, @tester.call_squadrons
  end

  def test_characters
    assert_kind_of Array, @tester.characters
  end

  def test_droids
    assert_kind_of Array, @tester.droids
  end

  def test_planets
    assert_kind_of Array, @tester.planets
  end

  def test_species
    assert_kind_of Array, @tester.species
  end

  def test_vehicles
    assert_kind_of Array, @tester.vehicles
  end

  def test_wookiee_words
    assert_kind_of Array, @tester.wookiee_words
  end
end
