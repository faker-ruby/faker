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
    assert Faker::Address.country.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.street_root.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.country_code.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert_equal('Österreich', Faker::Address.default_country)
  end

  def test_de_at_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Company.legal_form.is_a? String
  end

  def test_de_at_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_de_at_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.nobility_title_prefix.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_de_at_phone_number_methods
    assert_match(/(43)|(06)|(436)[\d\s]+$/, Faker::PhoneNumber.cell_phone_with_country_code)
  end
end
