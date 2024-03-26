# frozen_string_literal: true

require_relative 'test_helper'

class TestFrLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'fr'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_fr_address_methods
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.full_address
    assert_match(/^\d{5}$/, Faker::Address.postcode)
    assert_match(/^\d+$/, Faker::Address.building_number)
    full_address_regex = /(([-a-zA-ZéÉèÈàÀùÙâÂêÊîÎôÔûÛïÏëËüÜçÇæœ'.]*\s)\d*(\s[-a-zA-ZéÉèÈàÀùÙâÂêÊîÎôÔûÛïÏëËüÜçÇæœ']*)*,)*\d*(\s[-a-zA-ZéÉèÈàÀùÙâÂêÊîÎôÔûÛïÏëËüÜçÇæœ']*)+,\s(\d{5})\s[-a-zA-ZéÉèÈàÀùÙâÂêÊîÎôÔûÛïÏëËüÜçÇæœ']+/

    assert_match(full_address_regex, Faker::Address.full_address)
    assert_equal('France', Faker::Address.default_country)
  end

  def test_fr_adjective_methods
    assert_kind_of String, Faker::Adjective.positive
    assert_kind_of String, Faker::Adjective.negative
  end

  def test_fr_ancient_methods
    assert_kind_of String, Faker::Ancient.god
    assert_kind_of String, Faker::Ancient.primordial
    assert_kind_of String, Faker::Ancient.titan
    assert_kind_of String, Faker::Ancient.hero
  end

  def test_fr_appliance_methods
    assert_kind_of String, Faker::Appliance.equipment
  end

  def test_fr_book_methods
    assert_kind_of String, Faker::Book.title
    assert_kind_of String, Faker::Book.author
    assert_kind_of String, Faker::Book.publisher
    assert_kind_of String, Faker::Book.quote
  end

  def test_fr_color_methods
    assert_kind_of String, Faker::Color.color_name
  end

  def test_fr_compass_methods
    direction_pattern = /^\w+(-\w+){0,2}$/
    cardinal_pattern = /^\w+$/
    ordinal_pattern = /^\w+(-\w+){1}$/
    half_wind_patern = /^\w+(-\w+){2}$/
    letter_pattern = /^[NEOS]{1,3}$/

    assert_match(direction_pattern, Faker::Compass.direction)
    assert_match(cardinal_pattern, Faker::Compass.cardinal)
    assert_match(ordinal_pattern, Faker::Compass.ordinal)
    assert_match(half_wind_patern, Faker::Compass.half_wind)

    assert_match(letter_pattern, Faker::Compass.abbreviation)
    assert_match(letter_pattern, Faker::Compass.cardinal_abbreviation)
    assert_match(letter_pattern, Faker::Compass.ordinal_abbreviation)
    assert_match(letter_pattern, Faker::Compass.half_wind_abbreviation)
  end

  def test_fr_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.buzzword
    assert_kind_of String, Faker::Company.bs
    assert_kind_of String, Faker::Company.name
  end

  def test_fr_demographic_methods
    assert_includes %w[Homme Femme], Faker::Demographic.sex
  end

  def test_fr_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_fr_gender_methods
    assert_includes %w[Masculin Féminin], Faker::Gender.binary_type
  end

  def test_fr_lorem_methods
    assert_kind_of String, Faker::Lorem.word
    assert Faker::Lorem.words(number: 1000)
    assert Faker::Lorem.words(number: 10_000, supplemental: true)
  end

  def test_fr_measurement_methods
    metric_height_pattern = /mètre/
    metric_length_pattern = /mètre/
    metric_volume_pattern = /litre|cube/
    metric_weight_patern = /gramme|tonne/

    assert_match(metric_height_pattern, Faker::Measurement.metric_height)
    assert_match(metric_length_pattern, Faker::Measurement.metric_length)
    assert_match(metric_volume_pattern, Faker::Measurement.metric_volume)
    assert_match(metric_weight_patern, Faker::Measurement.metric_weight)
  end

  def test_fr_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_fr_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.phone_number
    assert_kind_of String, Faker::PhoneNumber.cell_phone
  end

  def test_fr_phone_format
    phone = Faker::PhoneNumber.phone_number_with_country_code.gsub(/\D/, '')

    assert_match(/^(0|33)\d{8,10}$/, phone)
  end

  def test_fr_cell_phone_format
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')

    assert_match(/^0?(6|7)\d{8}$/, mobile)
  end

  def test_fr_creature_methods
    assert_kind_of String, Faker::Creature::Animal.name
  end

  def test_fr_pokemon_methods
    assert_kind_of String, Faker::Games::Pokemon.name
    assert_kind_of String, Faker::Games::Pokemon.location
    assert_kind_of String, Faker::Games::Pokemon.move
  end
end
