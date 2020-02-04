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
    assert_match(/^[[:word:]]+[\.]? \d{1,3}$/, Faker::Address.secondary_address)
    assert_match(/^[\d]{3,5}$/, Faker::Address.building_number)
    assert_match(/^[\d]{4}$/, Faker::Address.postcode)

    assert Faker::Address.country_code.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.country.is_a? String
    assert_equal('Portugal', Faker::Address.default_country)
  end

  def test_pt_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_pt_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.suffix.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_pt_phone_number
    assert_match(/^(\+351)?[\(\)\d\s\-]+$/, Faker::PhoneNumber.phone_number)
  end
end
