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
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.country_code.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert_match(/\d{4}$/, Faker::Address.postcode)
    assert_match(/\d{1,3}$/, Faker::Address.building_number)
    assert_equal 'Danmark', Faker::Address.default_country
  end

  def test_da_dk_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_da_dk_commerce_methods
    assert Faker::Commerce.color.is_a? String
    assert Faker::Commerce.department.is_a? String
    assert Faker::Commerce.product_name.is_a? String
    assert Faker::Commerce.name.is_a? String
  end

  def test_da_dk_internet_methods
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_da_dk_name_methods
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.prefix.is_a? String
  end

  def test_da_dk_phone_number_methods
    assert_match(/(20)|(30)|(40)[\d\s]+$/, Faker::PhoneNumber.cell_phone)
    assert_match(/(\d\d[\s\-]?){4}$/, Faker::PhoneNumber.phone_number)
  end
end
