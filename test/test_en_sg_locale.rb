# frozen_string_literal: true

require_relative 'test_helper'

class TestEnSgLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-SG'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_sg_address_methods
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.streets
    assert_kind_of String, Faker::Address.street_address
    assert_equal('Singapore', Faker::Address.default_country)
  end

  def test_en_sg_name_methods
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.male_english_name
    assert_kind_of String, Faker::Name.female_english_name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.name
  end

  def test_singapore_license_plate
    assert_match(/^S[A-Z]{2}\d{1,4}[A-Z]{1}$/, Faker::Vehicle.singapore_license_plate)
  end
end
