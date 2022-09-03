# frozen_string_literal: true

require_relative 'test_helper'

class TestEsArLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'es-AR'

    @no_words_pattern = /(?u:\w{0})$/
    @one_word_pattern = /(?u:\w+)/
    @one_or_more_words_pattern = /(?u:(?:\w+\ )*\w+)/
    @many_words_pattern = /(?u:(?:\w+\ )+\w+)/

    @name_with_nickname_pattern = /(?u:(?:'*\w+'*\ )+(?:'*\w+'*))/

    @compass_letter_pattern = /^[NEOS]{1,2}(?:p?[NEOS]{1,2})?$/
    @compass_number_pattern = /^\d+(?:.\d\d?)?$/
  end

  def teardown
    Faker::Config.locale = nil
  end

  # -- NAMES

  def test_es_ar_male_first_name
    assert_match Faker::Name.male_first_name, @one_or_more_words_pattern
  end

  def test_es_ar_female_first_name
    assert_match Faker::Name.female_first_name, @one_or_more_words_pattern
  end

  def test_es_ar_neutral_first_name
    assert_match Faker::Name.neutral_first_name, @no_words_pattern
  end

  def test_es_ar_last_name
    assert_match Faker::Name.last_name, @one_or_more_words_pattern
  end

  def test_es_ar_prefix
    assert_match Faker::Name.prefix, /(\w+\.)/u
  end

  def test_es_ar_suffix
    assert_match Faker::Name.suffix, /(\w+\.?)/u
  end

  def test_es_ar_name
    assert_match Faker::Name.name, @many_words_pattern
  end

  def test_es_ar_name_with_middle
    assert_match Faker::Name.name_with_middle, @many_words_pattern
  end

  # -- ADDRESS

  # -- -- CITY

  def test_es_ar_city_prefix
    assert_match Faker::Address.city_prefix, @one_or_more_words_pattern
  end

  def test_es_ar_city_suffix
    assert_match Faker::Address.city_suffix, @one_or_more_words_pattern
  end

  def test_es_ar_city
    assert_match Faker::Address.city, @one_or_more_words_pattern
  end

  # -- -- STATE

  def test_es_ar_state
    assert_match Faker::Address.state, @one_or_more_words_pattern
  end

  def test_es_ar_state_abbr
    assert_match Faker::Address.state_abbr, /(\w+\.*)/u
  end

  # -- -- ADDRESS

  def test_es_ar_building_number
    assert_match Faker::Address.building_number, /(S\/N|\d{2,5})/u
  end

  def test_es_ar_secondary_address
    assert_match Faker::Address.secondary_address, /(PB|PA|(Piso|UF N°)\s\d{1,2}|(Departamento|Depto.|Lote)\s\d{1,2}[A-Z]|Manzana\s[A-Z]\d)/u
  end

  def test_es_ar_street_suffix
    assert_match Faker::Address.street_suffix, @no_words_pattern
  end

  def test_es_ar_street_name
    assert_match Faker::Address.street_name, @one_or_more_words_pattern
  end

  def test_es_ar_street_address
    assert Faker::Address.street_address.is_a? String
  end

  def test_es_ar_postcode
    assert_match Faker::Address.postcode, /(\d{4}|[A-Z]\d{4}[A-Z]{3})/u
  end

  def test_es_ar_postcode_by_state_abbreviation
    assert_match Faker::Address.postcode(state_abbreviation: 'BA'), /(B\d{4}[A-Z]{3})/u
  end

  def test_es_ar_full_address
    assert Faker::Address.full_address.is_a? String
  end

  # -- -- COUNTRY

  def test_es_ar_country
    assert_match Faker::Address.country, @one_or_more_words_pattern
  end

  def test_es_ar_country_by_code
    assert_match Faker::Address.country_by_code(code: 'NL'), 'Holanda'
  end

  def test_es_ar_country_name_to_code
    assert_match Faker::Address.country_name_to_code(name: 'estados_unidos'), 'US'
  end

  def test_es_ar_default_country
    assert Faker::Address.default_country, 'Argentina'
  end

  # -- FOOTBALL

  def test_es_ar_football_team
    assert_match Faker::Sports::Football.team, @one_or_more_words_pattern
  end

  def test_es_ar_football_player
    assert_match Faker::Sports::Football.player, @name_with_nickname_pattern
  end

  def test_es_ar_football_coach
    assert_match Faker::Sports::Football.coach, @name_with_nickname_pattern
  end

  def test_es_ar_football_competition
    assert_match Faker::Sports::Football.competition, @one_or_more_words_pattern
  end

  def test_es_ar_football_position
    assert_match Faker::Sports::Football.position, @one_or_more_words_pattern
  end

  # -- BASKETBALL

  def test_es_ar_basketball_team
    assert_match Faker::Sports::Basketball.team, @one_or_more_words_pattern
  end

  def test_es_ar_basketball_player
    assert_match Faker::Sports::Basketball.player, @name_with_nickname_pattern
  end

  def test_es_ar_basketball_coach
    assert_match Faker::Sports::Basketball.coach, @name_with_nickname_pattern
  end

  def test_es_ar_basketball_position
    assert_match Faker::Sports::Basketball.position, @one_or_more_words_pattern
  end

  # -- TEAMS

  def test_es_ar_team_name
    assert_match Faker::Team.name, @one_or_more_words_pattern
  end

  def test_es_ar_team_sport
    assert_match Faker::Team.sport, @one_or_more_words_pattern
  end

  # -- MILITARY

  def test_es_ar_army_rank
    assert_match Faker::Military.army_rank, @one_or_more_words_pattern
  end

  def test_es_ar_marines_rank
    assert_match Faker::Military.marines_rank, @no_words_pattern
  end

  def test_es_ar_navy_rank
    assert_match Faker::Military.navy_rank, @one_or_more_words_pattern
  end

  def test_es_ar_coast_guard_rank
    assert_match Faker::Military.coast_guard_rank, @one_or_more_words_pattern
  end

  def test_es_ar_air_force_rank
    assert_match Faker::Military.air_force_rank, @one_or_more_words_pattern
  end

  def test_es_ar_space_force_rank
    assert_match Faker::Military.space_force_rank, @no_words_pattern
  end

  # -- COMPASS

  def test_es_ar_cardinal
    assert_match Faker::Compass.cardinal, @one_word_pattern
  end

  def test_es_ar_ordinal
    assert_match Faker::Compass.ordinal, @one_word_pattern
  end

  def test_es_ar_half_wind
    assert_match Faker::Compass.half_wind, @one_word_pattern
  end

  def test_es_ar_quarter_wind
    assert_match Faker::Compass.quarter_wind, /^\w+ por el \w+$/u
  end

  def test_es_ar_direction
    assert_match Faker::Compass.direction, /^(?:\w+|\w+ por el \w+|[\w\-]+)$/u
  end

  def test_es_ar_abbreviation
    assert_match Faker::Compass.abbreviation, @compass_letter_pattern
  end

  def test_es_ar_azimuth
    assert_match Faker::Compass.azimuth, @compass_number_pattern
  end

  def test_es_ar_cardinal_abbreviation
    assert_match Faker::Compass.cardinal_abbreviation, @compass_letter_pattern
  end

  def test_es_ar_ordinal_abbreviation
    assert_match Faker::Compass.ordinal_abbreviation, @compass_letter_pattern
  end

  def test_es_ar_half_wind_abbreviation
    assert_match Faker::Compass.half_wind_abbreviation, @compass_letter_pattern
  end

  def test_es_ar_quarter_wind_abbreviation
    assert_match Faker::Compass.quarter_wind_abbreviation, @compass_letter_pattern
  end

  def test_es_ar_cardinal_azimuth
    assert_match Faker::Compass.cardinal_azimuth, @compass_number_pattern
  end

  def test_es_ar_ordinal_azimuth
    assert_match Faker::Compass.ordinal_azimuth, @compass_number_pattern
  end

  def test_es_ar_half_wind_azimuth
    assert_match Faker::Compass.half_wind_azimuth, @compass_number_pattern
  end

  def test_es_ar_quarter_wind_azimuth
    assert_match Faker::Compass.quarter_wind_azimuth, @compass_number_pattern
  end

  # -- PHONE NUMBERS

  def test_es_ar_phone_number
    assert_match Faker::PhoneNumber.phone_number, /^\((?:011|0(?:2|3)\d{2,3}|)\) (?:4|5|6)(?:\d{3} \d{4}|\d{2}-\d{4}|\d{5})$/u
  end

  def test_es_ar_cell_phone
    assert_match Faker::PhoneNumber.cell_phone, /^(?:11|(?:2|3)\d{2,3})(?:-| )(?:4|5|6|7)(?:\d{3}(?:-| )\d{4}|\d{2}(?:-| )\d{4}|\d{5})$/u
  end

  def test_es_ar_country_code
    assert_match Faker::PhoneNumber.country_code, /\+54/u
  end

  def test_es_ar_phone_number_with_country_code
    assert_match Faker::PhoneNumber.phone_number_with_country_code, /^\+54 \((?:011|0(?:2|3)\d{2,3}|)\) (?:4|5|6)(?:\d{3} \d{4}|\d{2}-\d{4}|\d{5})$/u
  end

  def test_es_ar_cell_phone_with_country_code
    assert_match Faker::PhoneNumber.cell_phone_with_country_code, /^\+54 (?:11|(?:2|3)\d{2,3})(?:-| )(?:4|5|6|7)(?:\d{3}(?:-| )\d{4}|\d{2}(?:-| )\d{4}|\d{5})$/u
  end

  def test_es_ar_cell_phone_in_e164
    assert_match Faker::PhoneNumber.cell_phone_in_e164, /^\+54(?:11|(?:2|3)\d{2,3})(?:4|5|6|7)(?:\d{3}\d{4}|\d{2}\d{4}|\d{5})$/u
  end

  # -- BANK

  def test_es_ar_bank_names
    assert_match Faker::Bank.name, @one_or_more_words_pattern
  end

  # -- COLORS

  def test_es_ar_color_names
    assert_match Faker::Color.color_name, @one_or_more_words_pattern
  end

  # -- CURRENCIES

  def test_es_ar_currency_names
    assert_match Faker::Currency.name, @one_or_more_words_pattern
  end

  # -- NATIONS

  def test_es_ar_nation_nationalities
    assert_match Faker::Nation.nationality, @one_or_more_words_pattern
  end

  def test_es_ar_nation_languages
    assert_match Faker::Nation.language, @one_or_more_words_pattern
  end

  def test_es_ar_nation_capital_city
    assert_match Faker::Nation.capital_city, @one_or_more_words_pattern
  end

  def test_es_ar_national_sport
    assert_match Faker::Nation.national_sport, @one_or_more_words_pattern
  end

  # -- COMPANY

  def test_es_ar_company_name
    assert_match Faker::Company.name, @one_or_more_words_pattern
  end

  def test_es_ar_company_suffix
    assert_match Faker::Company.suffix, @one_or_more_words_pattern
  end

  def test_es_ar_company_industry
    assert_match Faker::Company.industry, @one_or_more_words_pattern
  end

  def test_es_ar_company_bs
    assert_match Faker::Company.bs, @one_or_more_words_pattern
  end

  def test_es_ar_company_type
    assert_match Faker::Company.type, @one_or_more_words_pattern
  end

  def test_es_ar_company_profession
    assert_match Faker::Company.profession, @one_or_more_words_pattern
  end
end
