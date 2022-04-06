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
    assert @tester.character.match(/\w+/)
  end

  def test_game
    assert @tester.game.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_program
    assert @tester.program.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  # test good match
  def test_quote_random_character
    assert @tester.quote(character: 'dr_lora_baines').match(/\w+/)
  end

  # test good alternate spelling match
  def test_quote_random_character_alt_spelling
    assert @tester.quote(character: 'Laura Baines').match(/\w+/)
  end

  # test error on no match
  def test_quote_invalid
    assert_raise ArgumentError do
      @tester.quote(character: 'Leto Atreides')
    end
  end

  def test_tagline
    assert @tester.tagline.match(/\w+/)
  end

  def test_user
    assert @tester.user.match(/\w+/)
  end

  def test_vehicle
    assert @tester.vehicle.match(/\w+/)
  end

  def test_characters
    characters = @tester.characters

    assert characters.is_a?(Array)
    assert characters.length == CHARACTER_COUNT
  end

  def test_games
    games = @tester.games

    assert games.is_a?(Array)
    assert games.length == GAME_COUNT
  end

  def test_locations
    locations = @tester.locations

    assert locations.is_a?(Array)
    assert locations.length == LOCATION_COUNT
  end

  def test_programs
    programs = @tester.programs

    assert programs.is_a?(Array)
    assert programs.length == PROGRAM_COUNT
  end

  def test_taglines
    taglines = @tester.taglines

    assert taglines.is_a?(Array)
    assert taglines.length == TAGLINE_COUNT
  end

  def test_users
    users = @tester.users

    assert users.is_a?(Array)
    assert users.length == USER_COUNT
  end

  def test_vehicles
    vehicles = @tester.vehicles

    assert vehicles.is_a?(Array)
    assert vehicles.length == VEHICLE_COUNT
  end
end
