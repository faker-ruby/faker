# frozen_string_literal: true

require_relative 'test_helper'

class TestNbNoLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'nb-NO'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_nb_no_address_methods
    assert_kind_of String, Faker::Address.city_root
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.street_root
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.common_street_suffix
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.default_country
    assert_equal('Norge', Faker::Address.default_country)
  end

  def test_nb_no_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.name
  end

  def test_nb_no_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_nb_no_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.suffix
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.female_first_name
  end

  def test_nb_no_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.cell_phone
    assert_kind_of String, Faker::PhoneNumber.phone_number
  end
end
