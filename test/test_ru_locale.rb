# frozen_string_literal: true

require_relative 'test_helper'

class TestRuLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ru'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ru_address_methods
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.street_title
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.full_address
    assert_kind_of String, Faker::Address.street_address
    assert_equal 'Россия', Faker::Address.default_country
  end

  def test_ru_commerce_methods
    assert_kind_of String, Faker::Commerce.color
    assert_kind_of String, Faker::Commerce.department
    assert_kind_of String, Faker::Commerce.product_name
  end

  def test_ru_company_methods
    assert_kind_of String, Faker::Company.prefix
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.name
  end

  def test_ru_char_methods
    assert_kind_of String, Faker::Char.romanize_cyrillic('')
  end

  def test_ru_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_ru_name_methods
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.male_middle_name
    assert_kind_of String, Faker::Name.male_last_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.female_middle_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
  end
end
