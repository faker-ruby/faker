# frozen_string_literal: true

require_relative 'test_helper'

class TestEsUyLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'es-UY'

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

  def test_es_uy_male_first_name
    assert_match @one_or_more_words_pattern, Faker::Name.male_first_name
  end

  def test_es_uy_female_first_name
    assert_match @one_or_more_words_pattern, Faker::Name.female_first_name
  end

  def test_es_uy_neutral_first_name
    assert_match @no_words_pattern, Faker::Name.neutral_first_name
  end

  def test_es_uy_last_name
    assert_match @one_or_more_words_pattern, Faker::Name.last_name
  end

  def test_es_uy_prefix
    assert_match(/(\w+\.)/u, Faker::Name.prefix)
  end

  def test_es_uy_suffix
    assert_match(/(\w+\.?)/u, Faker::Name.suffix)
  end

  def test_es_uy_name
    assert_match @many_words_pattern, Faker::Name.name
  end

  def test_es_uy_name_with_middle
    assert_match @many_words_pattern, Faker::Name.name_with_middle
  end

  # -- ADDRESS

  # -- -- CITY

  def test_es_uy_city_prefix
    assert_match @one_or_more_words_pattern, Faker::Address.city_prefix
  end

  def test_es_uy_city_suffix
    assert_match @one_or_more_words_pattern, Faker::Address.city_suffix
  end

  def test_es_uy_city
    assert_match @one_or_more_words_pattern, Faker::Address.city
  end

  # -- -- STATE

  def test_es_uy_state
    assert_match @one_or_more_words_pattern, Faker::Address.state
  end

  def test_es_uy_state_abbr
    assert_match(/(\w+\.*)/u, Faker::Address.state_abbr)
  end

  # -- -- ADDRESS

  def test_es_uy_building_number
    assert_match(/(S\/N|\d{2,5})/u, Faker::Address.building_number)
  end

  def test_es_uy_secondary_address
    assert_match(/(PB|Piso\s\d{1,2}|(Apartamento|Apto.)\s\d{1,2}[A-Z]|Manzana|Solar\s[A-Z]\d)/u, Faker::Address.secondary_address)
  end

  def test_es_uy_street_suffix
    assert_match @no_words_pattern, Faker::Address.street_suffix
  end

  def test_es_uy_street_name
    assert_match @one_or_more_words_pattern, Faker::Address.street_name
  end

  def test_es_uy_street_address
    assert_kind_of String, Faker::Address.street_address
  end

  def test_es_uy_postcode
    assert_match(/(\d{5})/u, Faker::Address.postcode)
  end

  def test_es_uy_postcode_by_state_abbreviation
    assert_match(/(\d{5})/u, Faker::Address.postcode(state_abbreviation: 'MO'))
  end

  def test_es_uy_full_address
    assert_kind_of String, Faker::Address.full_address
  end

  # -- -- COUNTRY

  def test_es_uy_country
    assert_match @one_or_more_words_pattern, Faker::Address.country
  end

  def test_es_uy_country_by_code
    assert_match Faker::Address.country_by_code(code: 'NL'), 'Holanda'
  end

  def test_es_uy_country_name_to_code
    assert_match Faker::Address.country_name_to_code(name: 'estados_unidos'), 'US'
  end

  def test_es_uy_default_country
    assert Faker::Address.default_country, 'Uruguay'
  end

  # -- FOOTBALL

  def test_es_uy_football_team
    assert_match @one_or_more_words_pattern, Faker::Sports::Football.team
  end

  def test_es_uy_football_player
    assert_match @name_with_nickname_pattern, Faker::Sports::Football.player
  end

  def test_es_uy_football_coach
    assert_match @name_with_nickname_pattern, Faker::Sports::Football.coach
  end

  def test_es_uy_football_competition
    assert_match @one_or_more_words_pattern, Faker::Sports::Football.competition
  end

  def test_es_uy_football_position
    assert_match @one_or_more_words_pattern, Faker::Sports::Football.position
  end

  # -- BASKETBALL

  def test_es_uy_basketball_team
    assert_match @one_or_more_words_pattern, Faker::Sports::Basketball.team
  end

  def test_es_uy_basketball_player
    assert_match @name_with_nickname_pattern, Faker::Sports::Basketball.player
  end

  def test_es_uy_basketball_coach
    assert_match @name_with_nickname_pattern, Faker::Sports::Basketball.coach
  end

  def test_es_uy_basketball_position
    assert_match @one_or_more_words_pattern, Faker::Sports::Basketball.position
  end

  # -- TEAMS

  def test_es_uy_team_name
    assert_match @one_or_more_words_pattern, Faker::Team.name
  end

  def test_es_uy_team_sport
    assert_match @one_or_more_words_pattern, Faker::Team.sport
  end

  # -- MILITARY

  def test_es_uy_army_rank
    assert_match @one_or_more_words_pattern, Faker::Military.army_rank
  end

  def test_es_uy_marines_rank
    assert_match @no_words_pattern, Faker::Military.marines_rank
  end

  def test_es_uy_navy_rank
    assert_match @one_or_more_words_pattern, Faker::Military.navy_rank
  end

  def test_es_uy_coast_guard_rank
    assert_match @one_or_more_words_pattern, Faker::Military.coast_guard_rank
  end

  def test_es_uy_air_force_rank
    assert_match @one_or_more_words_pattern, Faker::Military.air_force_rank
  end

  def test_es_uy_space_force_rank
    assert_match @no_words_pattern, Faker::Military.space_force_rank
  end

  # -- COMPASS

  def test_es_uy_cardinal
    assert_match @one_word_pattern, Faker::Compass.cardinal
  end

  def test_es_uy_ordinal
    assert_match @one_word_pattern, Faker::Compass.ordinal
  end

  def test_es_uy_half_wind
    assert_match @one_word_pattern, Faker::Compass.half_wind
  end

  def test_es_uy_quarter_wind
    assert_match(/^\w+ por el \w+$/u, Faker::Compass.quarter_wind)
  end

  def test_es_uy_direction
    assert_match(/^(?:\w+|\w+ por el \w+|[\w-]+)$/u, Faker::Compass.direction)
  end

  def test_es_uy_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.abbreviation
  end

  def test_es_uy_azimuth
    assert_match @compass_number_pattern, Faker::Compass.azimuth
  end

  def test_es_uy_cardinal_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.cardinal_abbreviation
  end

  def test_es_uy_ordinal_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.ordinal_abbreviation
  end

  def test_es_uy_half_wind_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.half_wind_abbreviation
  end

  def test_es_uy_quarter_wind_abbreviation
    assert_match @compass_letter_pattern, Faker::Compass.quarter_wind_abbreviation
  end

  def test_es_uy_cardinal_azimuth
    assert_match @compass_number_pattern, Faker::Compass.cardinal_azimuth
  end

  def test_es_uy_ordinal_azimuth
    assert_match @compass_number_pattern, Faker::Compass.ordinal_azimuth
  end

  def test_es_uy_half_wind_azimuth
    assert_match @compass_number_pattern, Faker::Compass.half_wind_azimuth
  end

  def test_es_uy_quarter_wind_azimuth
    assert_match @compass_number_pattern, Faker::Compass.quarter_wind_azimuth
  end

  # -- PHONE NUMBERS

  def test_es_uy_phone_number
    assert_match(/^(2|4){1}\d{3} \d{4}$/u, Faker::PhoneNumber.phone_number)
  end

  def test_es_uy_cell_phone
    assert_match(/^9[1-9]{1} \d{6}$/u, Faker::PhoneNumber.cell_phone)
  end

  def test_es_uy_country_code
    assert_match(/\+598/u, Faker::PhoneNumber.country_code)
  end

  def test_es_uy_phone_number_with_country_code
    assert_match(/^\+598 (2|4){1}\d{3} \d{4}$/u, Faker::PhoneNumber.phone_number_with_country_code)
  end

  def test_es_uy_cell_phone_with_country_code
    assert_match(/^\+598 9[1-9]{1} \d{6}$/u, Faker::PhoneNumber.cell_phone_with_country_code)
  end

  def test_es_uy_cell_phone_in_e164
    assert_match(/^\+5989[1-9]{1}\d{6}$/u, Faker::PhoneNumber.cell_phone_in_e164)
  end

  # -- BANK

  def test_es_uy_bank_names
    assert_match @one_or_more_words_pattern, Faker::Bank.name
  end

  # -- COLORS

  def test_es_uy_color_names
    assert_match @one_or_more_words_pattern, Faker::Color.color_name
  end

  # -- CURRENCIES

  def test_es_uy_currency_names
    assert_match @one_or_more_words_pattern, Faker::Currency.name
  end

  # -- NATIONS

  def test_es_uy_nation_nationalities
    assert_match @one_or_more_words_pattern, Faker::Nation.nationality
  end

  def test_es_uy_nation_languages
    assert_match @one_or_more_words_pattern, Faker::Nation.language
  end

  def test_es_uy_nation_capital_city
    assert_match @one_or_more_words_pattern, Faker::Nation.capital_city
  end

  def test_es_uy_national_sport
    assert_match @one_or_more_words_pattern, Faker::Nation.national_sport
  end

  # -- COMPANY

  def test_es_uy_company_name
    assert_match @one_or_more_words_pattern, Faker::Company.name
  end

  def test_es_uy_company_suffix
    assert_match @one_or_more_words_pattern, Faker::Company.suffix
  end

  def test_es_uy_company_industry
    assert_match @one_or_more_words_pattern, Faker::Company.industry
  end

  def test_es_uy_company_bs
    assert_match @one_or_more_words_pattern, Faker::Company.bs
  end

  def test_es_uy_company_type
    assert_match @one_or_more_words_pattern, Faker::Company.type
  end

  def test_es_uy_company_profession
    assert_match @one_or_more_words_pattern, Faker::Company.profession
  end
end
