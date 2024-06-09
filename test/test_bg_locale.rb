# frozen_string_literal: true

require_relative 'test_helper'

class TestBgLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'bg'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_bg_methods
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.street_title
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_equal 'България', Faker::Address.default_country
  end

  def test_bg_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_bg_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.male_middle_name
    assert_kind_of String, Faker::Name.male_last_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.female_middle_name
    assert_kind_of String, Faker::Name.female_middle_name
    assert_kind_of String, Faker::Name.name
  end

  def test_bg_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.cell_phone
  end

  def test_bg_cell_number_starts_wiht_08
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')

    assert_equal '08', mobile[0] + mobile[1]
  end
end
