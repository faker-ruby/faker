# frozen_string_literal: true

require_relative 'test_helper'

class TestDaDkLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'da-DK'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_da_dk_address_methods
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.country_code
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.street_address
    assert_match(/\d{4}$/, Faker::Address.postcode)
    assert_match(/\d{1,3}$/, Faker::Address.building_number)
    assert_equal 'Danmark', Faker::Address.default_country
  end

  def test_da_dk_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.name
  end

  def test_da_dk_commerce_methods
    assert_kind_of String, Faker::Commerce.color
    assert_kind_of String, Faker::Commerce.department
    assert_kind_of String, Faker::Commerce.product_name
    assert_kind_of String, Faker::Commerce.name
  end

  def test_da_dk_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_da_dk_name_methods
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.prefix
  end

  def test_da_dk_phone_number_methods
    assert_match(/(20)|(30)|(40)[\d\s]+$/, Faker::PhoneNumber.cell_phone)
    assert_match(/(\d\d[\s-]?){4}$/, Faker::PhoneNumber.phone_number)
  end

  def test_da_dk_counrty_code
    assert_equal '+45', Faker::PhoneNumber.country_code
    assert_match(/(\+45)[\s](\d\d[\s-]?){4}$/, Faker::PhoneNumber.phone_number_with_country_code)
    assert_match(/(\+45)[\s](\d\d[\s-]?){4}$/, Faker::PhoneNumber.cell_phone_with_country_code)
  end
end
