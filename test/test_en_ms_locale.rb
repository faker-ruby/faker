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
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.province.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.street_title.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::PhoneNumber.cell_phone.is_a? String
    assert Faker::Bank.name.is_a? String
    assert_equal('Malaysia', Faker::Address.default_country)
  end

  def test_en_ms_bank_methods
    assert Faker::Bank.name.is_a? String
  end

  def test_en_ms_name_methods
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.malay_male_first_name.is_a? String
    assert Faker::Name.malay_female_first_name.is_a? String
    assert Faker::Name.chinese_male_first_name.is_a? String
    assert Faker::Name.chinese_male_last_name.is_a? String
    assert Faker::Name.chinese_female_first_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
  end
end
