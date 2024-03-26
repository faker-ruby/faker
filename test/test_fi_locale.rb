# frozen_string_literal: true

require_relative 'test_helper'

class TestFiLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'fi-FI'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_fi_address_methods
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.state
    assert_match(/^\d{1,3}$/, Faker::Address.building_number)
    assert_match(/^\d{5}$/, Faker::Address.postcode)
    assert_equal('Suomi', Faker::Address.default_country)
  end

  def test_fi_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.male_first_name
  end

  def test_fi_invoice_methods
    assert_kind_of String, Faker::Invoice.creditor_reference
    assert_kind_of String, Faker::Invoice.reference
    assert_kind_of String, Faker::Invoice.reference(ref: '515141803475128')
    assert_equal('5151418034751285', Faker::Invoice.reference(ref: '515141803475128#'))
  end

  def test_fi_phone_number
    assert_match(/0\d{2}[-\s]?\d{6}/, Faker::PhoneNumber.cell_phone)
    assert_match(/\d{2,3}[\s-]?\d{5,6}/, Faker::PhoneNumber.phone_number)
  end
end
