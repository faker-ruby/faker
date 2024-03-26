# frozen_string_literal: true

require_relative 'test_helper'

class TestSKLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'sk'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_sk_address_methods
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.time_zone
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_equal 'Slovensko', Faker::Address.default_country
  end

  def test_sk_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.buzzword
    assert_kind_of String, Faker::Company.bs
    assert_kind_of String, Faker::Company.name
  end

  def test_sk_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_sk_name_methods
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.suffix
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
  end

  def test_sk_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.phone_number
  end
end
