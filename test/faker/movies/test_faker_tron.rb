# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTron < Test::Unit::TestCase
  CHARACTER_COUNT = 16
  GAME_COUNT = 14
  LOCATION_COUNT = 12
  PROGRAM_COUNT = 9
  TAGLINE_COUNT = 5
  USER_COUNT = 6
  VEHICLE_COUNT = 5

  def setup
    @tester = Faker::Movies::Tron
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_game
    assert_match(/\w+/, @tester.game)
  end

  def test_location
    assert_match(/\w+/, @tester.location)
  end

  def test_program
    assert_match(/\w+/, @tester.program)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end

  # test good match
  def test_quote_random_character
    assert_match(/\w+/, @tester.quote(character: 'dr_lora_baines'))
  end

  # test good alternate spelling match
  def test_quote_random_character_alt_spelling
    assert_match(/\w+/, @tester.quote(character: 'Laura Baines'))
  end

  # test error on no match
  def test_quote_invalid
    assert_raise ArgumentError do
      @tester.quote(character: 'Leto Atreides')
    end
  end

  def test_tagline
    assert_match(/\w+/, @tester.tagline)
  end

  def test_user
    assert_match(/\w+/, @tester.user)
  end

  def test_vehicle
    assert_match(/\w+/, @tester.vehicle)
  end

  def test_characters
    characters = @tester.characters

    assert characters.is_a?(Array)
    assert_equal characters.length, CHARACTER_COUNT
  end

  def test_games
    games = @tester.games

    assert games.is_a?(Array)
    assert_equal games.length, GAME_COUNT
  end

  def test_locations
    locations = @tester.locations

    assert locations.is_a?(Array)
    assert_equal locations.length, LOCATION_COUNT
  end

  def test_programs
    programs = @tester.programs

    assert programs.is_a?(Array)
    assert_equal programs.length, PROGRAM_COUNT
  end

  def test_taglines
    taglines = @tester.taglines

    assert taglines.is_a?(Array)
    assert_equal taglines.length, TAGLINE_COUNT
  end

  def test_users
    users = @tester.users

    assert users.is_a?(Array)
    assert_equal users.length, USER_COUNT
  end

  def test_vehicles
    vehicles = @tester.vehicles

    assert vehicles.is_a?(Array)
    assert_equal vehicles.length, VEHICLE_COUNT
  end
end
