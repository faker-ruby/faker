# frozen_string_literal: true

require_relative 'test_helper'

class TestEnMsLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-MS'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_ms_address_methods
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.province
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.street_title
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::PhoneNumber.cell_phone
    assert_kind_of String, Faker::Bank.name
    assert_equal('Malaysia', Faker::Address.default_country)
  end

  def test_en_ms_bank_methods
    assert_kind_of String, Faker::Bank.name
  end

  def test_en_ms_name_methods
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.malay_male_first_name
    assert_kind_of String, Faker::Name.malay_female_first_name
    assert_kind_of String, Faker::Name.chinese_male_first_name
    assert_kind_of String, Faker::Name.chinese_male_last_name
    assert_kind_of String, Faker::Name.chinese_female_first_name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.female_first_name
  end
end
