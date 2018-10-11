# frozen_string_literal: true

require_relative 'test_helper'

class TestFiLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'fi-FI'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_address_methods
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.state.is_a? String
    assert_match(/^[\d]{1,3}$/, Faker::Address.building_number)
    assert_match(/^[\d]{5}$/, Faker::Address.postcode)
  end

  def test_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.male_first_name.is_a? String
  end

  def test_fi_invoice_methods
    assert Faker::Invoice.creditor_reference.is_a? String
    assert Faker::Invoice.reference.is_a? String
    assert Faker::Invoice.reference('515141803475128').is_a? String
    assert Faker::Invoice.reference('515141803475128#') == '5151418034751285'
  end

  def test_fi_phone_number
    assert_match(/0\d{2}[\-\s]?\d{6}/, Faker::PhoneNumber.cell_phone)
    assert_match(/\d{2,3}[\s\-]?\d{5,6}/, Faker::PhoneNumber.phone_number)
  end
end
