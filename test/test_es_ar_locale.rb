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
    assert_match @one_or_more_words_pattern, Faker::Name.male_first_name
  end

  def test_es_ar_female_first_name
    assert_match @one_or_more_words_pattern, Faker::Name.female_first_name
  end

  def test_es_ar_neutral_first_name
    assert_match @no_words_pattern, Faker::Name.neutral_first_name
  end

  def test_es_ar_last_name
    assert_match @one_or_more_words_pattern, Faker::Name.last_name
  end

  def test_es_ar_prefix
    assert_match(/(\w+\.)/u, Faker::Name.prefix)
  end

  def test_es_ar_suffix
    assert_match(/(\w+\.?)/u, Faker::Name.suffix)
  end

  def test_es_ar_name
    assert_match @many_words_pattern, Faker::Name.name
  end

  def test_es_ar_name_with_middle
    assert_match @many_words_pattern, Faker::Name.name_with_middle
  end

  # -- ADDRESS

  # -- -- CITY

  def test_es_ar_city_prefix
    assert_match @one_or_more_words_pattern, Faker::Address.city_prefix
  end

  def test_es_ar_city_suffix
    assert_match @one_or_more_words_pattern, Faker::Address.city_suffix
  end

  def test_es_ar_city
    assert_match @one_or_more_words_pattern, Faker::Address.city
  end

  # -- -- STATE

  def test_es_ar_state
    assert_match @one_or_more_words_pattern, Faker::Address.state
  end

  def test_es_ar_state_abbr
    assert_match(/(\w+\.*)/u, Faker::Address.state_abbr)
  end

  # -- -- ADDRESS

  def test_es_ar_building_number
    assert_match(/(S\/N|\d{2,5})/u, Faker::Address.building_number)
  end

  def test_es_ar_secondary_address
    assert_match(/(PB|PA|(Piso|UF N°)\s\d{1,2}|(Departamento|Depto.|Lote)\s\d{1,2}[A-Z]|Manzana\s[A-Z]\d)/u, Faker::Address.secondary_address)
  end

  def test_es_ar_street_suffix
    assert_match @no_words_pattern, Faker::Address.street_suffix
  end

  def test_es_ar_street_name
    assert_match @one_or_more_words_pattern, Faker::Address.street_name
  end

  def test_es_ar_street_address
    assert Faker::Address.street_address.is_a? String
  end

  def test_es_ar_postcode
    assert_match(/(\d{4}|[A-Z]\d{4}[A-Z]{3})/u, Faker::Address.postcode)
  end

  def test_es_ar_postcode_by_state_abbreviation
    assert_match(/(B\d{4}[A-Z]{3})/u, Faker::Address.postcode(state_abbreviation: 'BA'))
  end

  def test_es_ar_full_address
    assert Faker::Address.full_address.is_a? String
  end

  # -- -- COUNTRY

  def test_es_ar_country
    assert_match @one_or_more_words_pattern, Faker::Address.country
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
    assert_match @one_or_more_words_pattern, Faker::Sports::Football.team
  end

  def test_es_ar_football_player
    assert_match @name_with_nickname_pattern, Faker::Sports::Football.player
  end

  def test_es_ar_football_coach
    assert_match @name_with_nickname_pattern, Faker::Sports::Football.coach
  end

  def test_es_ar_football_competition
    assert_match @one_or_more_words_pattern, Faker::Sports::Football.competition
  end

  def test_es_ar_football_position
    assert_match @one_or_more_words_pattern, Faker::Sports::Football.position
  end

  # -- BASKETBALL

  def test_es_ar_basketball_team
    assert_match @one_or_more_words_pattern, Faker::Sports::Basketball.team
  end

  def test_es_ar_basketball_player
    assert_match @name_with_nickname_pattern, Faker::Sports::Basketball.player
  end

  def test_es_ar_basketball_coach
    assert_match @name_with_nickname_pattern, Faker::Sports::Basketball.coach
  end

  def test_es_ar_basketball_position
    assert_match @one_or_more_words_pattern, Faker::Sports::Basketball.position
  end

  # -- TEAMS

  def test_es_ar_team_name
    assert_match @one_or_more_words_pattern, Faker::Team.name
  end

  def test_es_ar_team_sport
    assert_match @one_or_more_words_pattern, Faker::Team.sport
  end

  # -- MILITARY

  def test_es_ar_army_rank
    assert_match @one_or_more_words_pattern, Faker::Military.army_rank
  end

  def test_es_ar_marines_rank
    assert_match @no_words_pattern, Faker::Military.marines_rank
  end

  def test_es_ar_navy_rank
    assert_match @one_or_more_words_pattern, Faker::Military.navy_rank
  end

  def test_es_ar_coast_guard_rank
    assert_match @one_or_more_words_pattern, Faker::Military.coast_guard_rank
  end

  def test_es_ar_air_force_rank
    assert_match @one_or_more_words_pattern, Faker::Military.air_force_rank
  end

  def test_es_ar_space_force_rank
    assert_match @no_words_pattern, Faker::Military.space_force_rank
  end

  # -- COMPASS

  def test_es_ar_cardinal
    assert_match @one_word_pattern, Faker::Compass.cardinal
  end

  def test_es_ar_ordinal
    assert_match @one_word_pattern, Faker::Compass.ordinal
  end

  def test_es_ar_half_wind
    assert_match @one_word_pattern, Faker::Compass.half_wind
  end

  def test_es_ar_quarter_wind
    assert_match(/^\w+ por el \w+$/u, Faker::Compass.quarter_wind)
  end

  def test_es_ar_direction
    assert_match(/^(?:\w+|\w+ por el \w+|[\w-]+)$/u, Faker::Compass.direction)
  end

  def test_es_ar_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.abbreviation
  end

  def test_es_ar_azimuth
    assert_match @compass_number_pattern, Faker::Compass.azimuth
  end

  def test_es_ar_cardinal_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.cardinal_abbreviation
  end

  def test_es_ar_ordinal_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.ordinal_abbreviation
  end

  def test_es_ar_half_wind_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.half_wind_abbreviation
  end

  def test_es_ar_quarter_wind_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.quarter_wind_abbreviation
  end

  def test_es_ar_cardinal_azimuth
    assert_match @compass_number_pattern, Faker::Compass.cardinal_azimuth
  end

  def test_es_ar_ordinal_azimuth
    assert_match @compass_number_pattern, Faker::Compass.ordinal_azimuth
  end

  def test_es_ar_half_wind_azimuth
    assert_match @compass_number_pattern, Faker::Compass.half_wind_azimuth
  end

  def test_es_ar_quarter_wind_azimuth
    assert_match @compass_number_pattern, Faker::Compass.quarter_wind_azimuth
  end

  # -- PHONE NUMBERS

  def test_es_ar_phone_number
    assert_match(/^\((?:011|0(?:2|3)\d{2,3}|)\) (?:4|5|6)(?:\d{3} \d{4}|\d{2}-\d{4}|\d{5})$/u, Faker::PhoneNumber.phone_number)
  end

  def test_es_ar_cell_phone
    assert_match(/^(?:11|(?:2|3)\d{2,3})(?:-| )(?:4|5|6|7)(?:\d{3}(?:-| )\d{4}|\d{2}(?:-| )\d{4}|\d{5})$/u, Faker::PhoneNumber.cell_phone)
  end

  def test_es_ar_country_code
    assert_match(/\+54/u, Faker::PhoneNumber.country_code)
  end

  def test_es_ar_phone_number_with_country_code
    assert_match(/^\+54 \((?:011|0(?:2|3)\d{2,3}|)\) (?:4|5|6)(?:\d{3} \d{4}|\d{2}-\d{4}|\d{5})$/u, Faker::PhoneNumber.phone_number_with_country_code)
  end

  def test_es_ar_cell_phone_with_country_code
    assert_match(/^\+54 (?:11|(?:2|3)\d{2,3})(?:-| )(?:4|5|6|7)(?:\d{3}(?:-| )\d{4}|\d{2}(?:-| )\d{4}|\d{5})$/u, Faker::PhoneNumber.cell_phone_with_country_code)
  end

  def test_es_ar_cell_phone_in_e164
    assert_match(/^\+54(?:11|(?:2|3)\d{2,3})(?:4|5|6|7)(?:\d{3}\d{4}|\d{2}\d{4}|\d{5})$/u, Faker::PhoneNumber.cell_phone_in_e164)
  end

  # -- BANK

  def test_es_ar_bank_names
    assert_match @one_or_more_words_pattern, Faker::Bank.name
  end

  # -- COLORS

  def test_es_ar_color_names
    assert_match @one_or_more_words_pattern, Faker::Color.color_name
  end

  # -- CURRENCIES

  def test_es_ar_currency_names
    assert_match @one_or_more_words_pattern, Faker::Currency.name
  end

  # -- NATIONS

  def test_es_ar_nation_nationalities
    assert_match @one_or_more_words_pattern, Faker::Nation.nationality
  end

  def test_es_ar_nation_languages
    assert_match @one_or_more_words_pattern, Faker::Nation.language
  end

  def test_es_ar_nation_capital_city
    assert_match @one_or_more_words_pattern, Faker::Nation.capital_city
  end

  def test_es_ar_national_sport
    assert_match @one_or_more_words_pattern, Faker::Nation.national_sport
  end

  # -- COMPANY

  def test_es_ar_company_name
    assert_match @one_or_more_words_pattern, Faker::Company.name
  end

  def test_es_ar_company_suffix
    assert_match @one_or_more_words_pattern, Faker::Company.suffix
  end

  def test_es_ar_company_industry
    assert_match @one_or_more_words_pattern, Faker::Company.industry
  end

  def test_es_ar_company_bs
    assert_match @one_or_more_words_pattern, Faker::Company.bs
  end

  def test_es_ar_company_type
    assert_match @one_or_more_words_pattern, Faker::Company.type
  end

  def test_es_ar_company_profession
    assert_match @one_or_more_words_pattern, Faker::Company.profession
  end
end
