# frozen_string_literal: true

require_relative 'test_helper'

class TestPtLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'pt'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_pt_address_methods
    assert_match(/^[[:word:]]+[.]? \d{1,3}$/, Faker::Address.secondary_address)
    assert_match(/^\d{3,5}$/, Faker::Address.building_number)
    assert_match(/^\d{4}$/, Faker::Address.postcode)

    assert_kind_of String, Faker::Address.country_code
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.country
    assert_equal('Portugal', Faker::Address.default_country)
  end

  def test_pt_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_pt_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.suffix
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_pt_phone_number
    assert_match(/^(\+351)?[()\d\s-]+$/, Faker::PhoneNumber.phone_number)
  end
end
