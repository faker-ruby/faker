# frozen_string_literal: true

require_relative 'test_helper'

class TestEnZaLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-ZA'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_za_address_methods
    assert_kind_of String, Faker::Address.country_code
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.province
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city
  end

  def test_en_za_company_methods
    assert_kind_of String, Faker::Company.name
    assert_kind_of String, Faker::Company.type
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.company_names
  end

  def test_en_za_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_en_za_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
  end
end
