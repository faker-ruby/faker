# frozen_string_literal: true

require_relative 'test_helper'

class TestDeLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'de'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_de_address_methods
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.street_root
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.country_code
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.time_zone
    assert_equal('Deutschland', Faker::Address.default_country)
  end

  def test_de_book_methods
    assert_kind_of String, Faker::Book.title
    assert_kind_of String, Faker::Book.author
    assert_kind_of String, Faker::Book.publisher
  end

  def test_de_chuck_norris_methods
    assert_kind_of String, Faker::ChuckNorris.fact
  end

  def test_de_color_methods
    assert_kind_of String, Faker::Color.color_name
  end

  def test_de_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.legal_form
    assert_kind_of String, Faker::Company.name
  end

  def test_de_compass_methods
    assert_kind_of String, Faker::Compass.direction
    assert_kind_of String, Faker::Compass.cardinal
    assert_kind_of String, Faker::Compass.ordinal
    assert_kind_of String, Faker::Compass.half_wind
    assert_kind_of String, Faker::Compass.quarter_wind
    assert_kind_of String, Faker::Compass.abbreviation
    assert_kind_of String, Faker::Compass.cardinal_abbreviation
    assert_kind_of String, Faker::Compass.ordinal_abbreviation
    assert_kind_of String, Faker::Compass.half_wind_abbreviation
    assert_kind_of String, Faker::Compass.quarter_wind_abbreviation
    assert_kind_of String, Faker::Compass.azimuth
    assert_kind_of String, Faker::Compass.cardinal_azimuth
    assert_kind_of String, Faker::Compass.ordinal_azimuth
    assert_kind_of String, Faker::Compass.half_wind_azimuth
    assert_kind_of String, Faker::Compass.quarter_wind_azimuth
  end

  def test_de_commerce_methods
    assert_kind_of String, Faker::Commerce.department
    assert_kind_of String, Faker::Commerce.product_name
  end

  def test_de_food_methods
    assert_kind_of String, Faker::Food.ingredient
    assert_kind_of String, Faker::Food.spice
    assert_kind_of String, Faker::Food.measurement
    assert_kind_of String, Faker::Food.measurement_sizes
  end

  def test_de_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_de_lorem_methods
    assert_kind_of Array, Faker::Lorem.words
  end

  def test_de_hipster_methods
    assert_kind_of Array, Faker::Hipster.words
  end

  def test_de_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.nobility_title_prefix
    assert_kind_of String, Faker::Name.nobility_title
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_de_music_methods
    assert_kind_of String, Faker::Music.instrument
  end

  def test_de_pokemon_methods
    assert_kind_of String, Faker::Games::Pokemon.name
  end

  def test_de_simpsons_methods
    assert_kind_of String, Faker::TvShows::Simpsons.character
  end

  def test_de_space_methods
    assert_kind_of String, Faker::Space.planet
    assert_kind_of String, Faker::Space.moon
    assert_kind_of String, Faker::Space.nebula
    assert_kind_of String, Faker::Space.star_cluster
    assert_kind_of String, Faker::Space.constellation
    assert_kind_of String, Faker::Space.agency
    assert_kind_of String, Faker::Space.galaxy
    assert_kind_of String, Faker::Space.star
    assert_kind_of String, Faker::Space.distance_measurement
  end

  def test_de_cell_phone_countrycode
    mobile = Faker::PhoneNumber.cell_phone_with_country_code.gsub(/\D/, '')

    assert_match(/^(0|49)/, mobile)
  end
end
