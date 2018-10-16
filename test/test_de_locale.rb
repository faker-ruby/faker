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
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.street_root.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.country_code.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.time_zone.is_a? String
    assert_equal('Deutschland', Faker::Address.default_country)
  end

  def test_de_book_methods
    assert Faker::Book.title.is_a? String
    assert Faker::Book.author.is_a? String
    assert Faker::Book.publisher.is_a? String
  end

  def test_de_chuck_norris_methods
    assert Faker::ChuckNorris.fact.is_a? String
  end

  def test_de_color_methods
    assert Faker::Color.name.is_a? String
  end

  def test_de_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.legal_form.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_de_compass_methods
    assert Faker::Compass.direction.is_a? String
    assert Faker::Compass.cardinal.is_a? String
    assert Faker::Compass.ordinal.is_a? String
    assert Faker::Compass.half_wind.is_a? String
    assert Faker::Compass.quarter_wind.is_a? String
    assert Faker::Compass.abbreviation.is_a? String
    assert Faker::Compass.cardinal_abbreviation.is_a? String
    assert Faker::Compass.ordinal_abbreviation.is_a? String
    assert Faker::Compass.half_wind_abbreviation.is_a? String
    assert Faker::Compass.quarter_wind_abbreviation.is_a? String
    assert Faker::Compass.azimuth.is_a? String
    assert Faker::Compass.cardinal_azimuth.is_a? String
    assert Faker::Compass.ordinal_azimuth.is_a? String
    assert Faker::Compass.half_wind_azimuth.is_a? String
    assert Faker::Compass.quarter_wind_azimuth.is_a? String
  end

  def test_de_commerce_methods
    assert Faker::Commerce.department.is_a? String
    assert Faker::Commerce.product_name.is_a? String
  end

  def test_de_food_methods
    assert Faker::Food.ingredient.is_a? String
    assert Faker::Food.spice.is_a? String
    assert Faker::Food.measurement.is_a? String
    assert Faker::Food.measurement_sizes.is_a? String
  end

  def test_de_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_de_lorem_methods
    assert Faker::Lorem.words.is_a? Array
  end

  def test_de_hipster_methods
    assert Faker::Hipster.words.is_a? Array
  end

  def test_de_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.nobility_title_prefix.is_a? String
    assert Faker::Name.nobility_title.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_de_music_methods
    assert Faker::Music.instrument.is_a? String
  end

  def test_de_pokemon_methods
    assert Faker::Pokemon.name.is_a? String
  end

  def test_de_simpsons_methods
    assert Faker::Simpsons.character.is_a? String
  end

  def test_de_space_methods
    assert Faker::Space.planet.is_a? String
    assert Faker::Space.moon.is_a? String
    assert Faker::Space.nebula.is_a? String
    assert Faker::Space.star_cluster.is_a? String
    assert Faker::Space.constellation.is_a? String
    assert Faker::Space.agency.is_a? String
    assert Faker::Space.galaxy.is_a? String
    assert Faker::Space.star.is_a? String
    assert Faker::Space.distance_measurement.is_a? String
  end

  def test_de_cell_phone_countrycode
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')
    assert_equal '4', mobile[0]
    assert_equal '9', mobile[1]
  end
end
