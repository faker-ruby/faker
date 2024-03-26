# frozen_string_literal: true

require_relative 'test_helper'

class TestDeAtLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'de-AT'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_de_at_address_methods
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.street_root
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.country_code
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_address
    assert_equal('Österreich', Faker::Address.default_country)
  end

  def test_de_at_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.name
    assert_kind_of String, Faker::Company.legal_form
  end

  def test_de_at_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_de_at_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.nobility_title_prefix
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_de_at_phone_number_methods
    assert_match(/(43)|(06)|(436)[\d\s]+$/, Faker::PhoneNumber.cell_phone_with_country_code)
  end
end
