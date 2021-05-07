# frozen_string_literal: true

require_relative 'test_helper'

class TestEsArLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'es-AR'

    @no_words_pattern = /(?u:\w{0})$/
    @one_word_pattern = /(?u:\w+)/
    @one_or_more_words_pattern = /(?u:(?:\w+\ )*\w+)/
    @many_words_pattern = /(?u:(?:\w+\ )+\w+)/

    @name_with_nickname_pattern = /(?u:(?:\'*\w+\'*\ )+(?:\'*\w+\'*))/

    @compass_letter_pattern = /^[NEOS]{1,2}(?:p?[NEOS]{1,2})?$/
    @compass_number_pattern = /^\d+(?:.\d\d?)?$/
  end

  def teardown
    Faker::Config.locale = nil
  end

  # -- NAMES

  def test_es_ar_male_first_name
    assert Faker::Name.male_first_name.match(@one_or_more_words_pattern)
  end

  def test_es_ar_female_first_name
    assert Faker::Name.female_first_name.match(@one_or_more_words_pattern)
  end

  def test_es_ar_neutral_first_name
    assert Faker::Name.neutral_first_name.match(@no_words_pattern)
  end

  def test_es_ar_last_name
    assert Faker::Name.last_name.match(@one_or_more_words_pattern)
  end

  def test_es_ar_prefix
    assert Faker::Name.prefix.match(/(\w+\.)/u)
  end

  def test_es_ar_suffix
    assert Faker::Name.suffix.match(/(\w+\.?)/u)
  end

  def test_es_ar_name
    assert Faker::Name.name.match(@many_words_pattern)
  end

  def test_es_ar_name_with_middle
    assert Faker::Name.name_with_middle.match(@many_words_pattern)
  end

  # -- ADDRESS

  # -- -- CITY

  def test_es_ar_city_prefix
    assert Faker::Address.city_prefix.match(@one_or_more_words_pattern)
  end

  def test_es_ar_city_suffix
    assert Faker::Address.city_suffix.match(@one_or_more_words_pattern)
  end

  def test_es_ar_city
    assert Faker::Address.city.match(@one_or_more_words_pattern)
  end

  # -- -- STATE

  def test_es_ar_state
    assert Faker::Address.state.match(@one_or_more_words_pattern)
  end

  def test_es_ar_state_abbr
    assert Faker::Address.state_abbr.match(/(\w+\.*)/u)
  end

  # -- -- ADDRESS

  def test_es_ar_building_number
    assert Faker::Address.building_number.match(/(S\/N|\d{2,5})/u)
  end

  def test_es_ar_secondary_address
    assert Faker::Address.secondary_address.match(/(PB|PA|(Piso|UF N°)\s\d{1,2}|(Departamento|Depto.|Lote)\s\d{1,2}[A-Z]|Manzana\s[A-Z]\d)/u)
  end

  def test_es_ar_street_suffix
    assert Faker::Address.street_suffix.match(@no_words_pattern)
  end

  def test_es_ar_street_name
    assert Faker::Address.street_name.match(@one_or_more_words_pattern)
  end

  def test_es_ar_street_address
    assert Faker::Address.street_address.is_a? String
  end

  def test_es_ar_postcode
    assert Faker::Address.postcode.match(/(\d{4}|[A-Z]\d{4}[A-Z]{3})/u)
  end

  def test_es_ar_postcode_by_state_abbreviation
    assert Faker::Address.postcode(state_abbreviation: 'BA').match(/(B\d{4}[A-Z]{3})/u)
  end

  def test_es_ar_full_address
    assert Faker::Address.full_address.is_a? String
  end

  # -- -- COUNTRY

  def test_es_ar_country
    assert Faker::Address.country.match(@one_or_more_words_pattern)
  end

  def test_es_ar_country_by_code
    assert Faker::Address.country_by_code(code: 'NL').match('Holanda')
  end

  def test_es_ar_country_name_to_code
    assert Faker::Address.country_name_to_code(name: 'estados_unidos').match('US')
  end

  def test_es_ar_default_country
    assert Faker::Address.default_country, 'Argentina'
  end

  # -- FOOTBALL

  def test_es_ar_football_team
    assert Faker::Sports::Football.team.match(@one_or_more_words_pattern)
  end

  def test_es_ar_football_player
    assert Faker::Sports::Football.player.match(@name_with_nickname_pattern)
  end

  def test_es_ar_football_coach
    assert Faker::Sports::Football.coach.match(@name_with_nickname_pattern)
  end

  def test_es_ar_football_competition
    assert Faker::Sports::Football.competition.match(@one_or_more_words_pattern)
  end

  def test_es_ar_football_position
    assert Faker::Sports::Football.position.match(@one_or_more_words_pattern)
  end

  # -- BASKETBALL

  def test_es_ar_basketball_team
    assert Faker::Sports::Basketball.team.match(@one_or_more_words_pattern)
  end

  def test_es_ar_basketball_player
    assert Faker::Sports::Basketball.player.match(@name_with_nickname_pattern)
  end

  def test_es_ar_basketball_coach
    assert Faker::Sports::Basketball.coach.match(@name_with_nickname_pattern)
  end

  def test_es_ar_basketball_position
    assert Faker::Sports::Basketball.position.match(@one_or_more_words_pattern)
  end

  # -- TEAMS

  def test_es_ar_team_name
    assert Faker::Team.name.match(@one_or_more_words_pattern)
  end

  def test_es_ar_team_sport
    assert Faker::Team.sport.match(@one_or_more_words_pattern)
  end

  # -- MILITARY

  def test_es_ar_army_rank
    assert Faker::Military.army_rank.match(@one_or_more_words_pattern)
  end

  def test_es_ar_marines_rank
    assert Faker::Military.marines_rank.match(@no_words_pattern)
  end

  def test_es_ar_navy_rank
    assert Faker::Military.navy_rank.match(@one_or_more_words_pattern)
  end

  def test_es_ar_coast_guard_rank
    assert Faker::Military.coast_guard_rank.match(@one_or_more_words_pattern)
  end

  def test_es_ar_air_force_rank
    assert Faker::Military.air_force_rank.match(@one_or_more_words_pattern)
  end

  def test_es_ar_space_force_rank
    assert Faker::Military.space_force_rank.match(@no_words_pattern)
  end

  # -- COMPASS

  def test_es_ar_cardinal
    assert Faker::Compass.cardinal.match(@one_word_pattern)
  end

  def test_es_ar_ordinal
    assert Faker::Compass.ordinal.match(@one_word_pattern)
  end

  def test_es_ar_half_wind
    assert Faker::Compass.half_wind.match(@one_word_pattern)
  end

  def test_es_ar_quarter_wind
    assert Faker::Compass.quarter_wind.match(/^\w+ por el \w+$/u)
  end

  def test_es_ar_direction
    assert Faker::Compass.direction.match(/^(?:\w+|\w+ por el \w+|[\w\-]+)$/u)
  end

  def test_es_ar_abbreviation
    assert Faker::Compass.abbreviation.match(@compass_letter_pattern)
  end

  def test_es_ar_azimuth
    assert Faker::Compass.azimuth.match(@compass_number_pattern)
  end

  def test_es_ar_cardinal_abbreviation
    assert Faker::Compass.cardinal_abbreviation.match(@compass_letter_pattern)
  end

  def test_es_ar_ordinal_abbreviation
    assert Faker::Compass.ordinal_abbreviation.match(@compass_letter_pattern)
  end

  def test_es_ar_half_wind_abbreviation
    assert Faker::Compass.half_wind_abbreviation.match(@compass_letter_pattern)
  end

  def test_es_ar_quarter_wind_abbreviation
    assert Faker::Compass.quarter_wind_abbreviation.match(@compass_letter_pattern)
  end

  def test_es_ar_cardinal_azimuth
    assert Faker::Compass.cardinal_azimuth.match(@compass_number_pattern)
  end

  def test_es_ar_ordinal_azimuth
    assert Faker::Compass.ordinal_azimuth.match(@compass_number_pattern)
  end

  def test_es_ar_half_wind_azimuth
    assert Faker::Compass.half_wind_azimuth.match(@compass_number_pattern)
  end

  def test_es_ar_quarter_wind_azimuth
    assert Faker::Compass.quarter_wind_azimuth.match(@compass_number_pattern)
  end

  # -- PHONE NUMBERS

  def test_es_ar_phone_number
    assert Faker::PhoneNumber.phone_number.match(/^\((?:011|0(?:2|3)\d{2,3}|)\) (?:4|5|6)(?:\d{3} \d{4}|\d{2}-\d{4}|\d{5})$/u)
  end

  def test_es_ar_cell_phone
    assert Faker::PhoneNumber.cell_phone.match(/^(?:11|(?:2|3)\d{2,3})(?:\-| )(?:4|5|6|7)(?:\d{3}(?:-| )\d{4}|\d{2}(?:-| )\d{4}|\d{5})$/u)
  end

  def test_es_ar_country_code
    assert Faker::PhoneNumber.country_code.match(/\+54/u)
  end

  def test_es_ar_phone_number_with_country_code
    assert Faker::PhoneNumber.phone_number_with_country_code.match(/^\+54 \((?:011|0(?:2|3)\d{2,3}|)\) (?:4|5|6)(?:\d{3} \d{4}|\d{2}-\d{4}|\d{5})$/u)
  end

  def test_es_ar_cell_phone_with_country_code
    assert Faker::PhoneNumber.cell_phone_with_country_code.match(/^\+54 (?:11|(?:2|3)\d{2,3})(?:\-| )(?:4|5|6|7)(?:\d{3}(?:-| )\d{4}|\d{2}(?:-| )\d{4}|\d{5})$/u)
  end

  def test_es_ar_cell_phone_in_e164
    assert Faker::PhoneNumber.cell_phone_in_e164.match(/^\+54(?:11|(?:2|3)\d{2,3})(?:4|5|6|7)(?:\d{3}\d{4}|\d{2}\d{4}|\d{5})$/u)
  end

  # -- BANK

  def test_es_ar_bank_names
    assert Faker::Bank.name.match(@one_or_more_words_pattern)
  end

  # -- COLORS

  def test_es_ar_color_names
    assert Faker::Color.color_name.match(@one_or_more_words_pattern)
  end

  # -- CURRENCIES

  def test_es_ar_currency_names
    assert Faker::Currency.name.match(@one_or_more_words_pattern)
  end

  # -- NATIONS

  def test_es_ar_nation_nationalities
    assert Faker::Nation.nationality.match(@one_or_more_words_pattern)
  end

  def test_es_ar_nation_languages
    assert Faker::Nation.language.match(@one_or_more_words_pattern)
  end

  def test_es_ar_nation_capital_city
    assert Faker::Nation.capital_city.match(@one_or_more_words_pattern)
  end

  def test_es_ar_national_sport
    assert Faker::Nation.national_sport.match(@one_or_more_words_pattern)
  end

  # -- COMPANY

  def test_es_ar_company_name
    assert Faker::Company.name.match(@one_or_more_words_pattern)
  end

  def test_es_ar_company_suffix
    assert Faker::Company.suffix.match(@one_or_more_words_pattern)
  end

  def test_es_ar_company_industry
    assert Faker::Company.industry.match(@one_or_more_words_pattern)
  end

  def test_es_ar_company_bs
    assert Faker::Company.bs.match(@one_or_more_words_pattern)
  end

  def test_es_ar_company_type
    assert Faker::Company.type.match(@one_or_more_words_pattern)
  end

  def test_es_ar_company_profession
    assert Faker::Company.profession.match(@one_or_more_words_pattern)
  end
end
