# frozen_string_literal: true

require_relative 'test_helper'

class TestEnUgLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-UG'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_ug_address_methods
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.city_names
    assert_kind_of String, Faker::Address.district_names
    assert_kind_of String, Faker::Address.regions
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.district
    assert_kind_of String, Faker::Address.region
  end

  def test_en_ug_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_en_ug_name_methods
    assert_kind_of String, Faker::Name.last_name
  end

  def test_validity_of_phone_number
    validation_regex = /^((0)|(256)|(\+256))((39)|(41))\d{7}$/

    assert_match(validation_regex, Faker::PhoneNumber.phone_number.delete(' '))
  end

  def test_validity_of_cell_phone
    validation_regex = /^((0)|(256)|(\+256))((70)|(71)|(72)|(74)|(75)|(77)|(78)|(79))\d{7}$/

    assert_match(validation_regex, Faker::PhoneNumber.cell_phone.delete(' '))
  end
end
