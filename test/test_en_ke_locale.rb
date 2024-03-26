# frozen_string_literal: true

require_relative 'test_helper'

class TestEnKeLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-KE'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_ke_address_methods
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.county
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.default_country_code
  end

  def test_en_ke_company_methods
    assert_kind_of String, Faker::Company.name
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.company_names
  end

  def test_en_ke_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_en_ke_country_code_starts_with_254
    phone_number = Faker::PhoneNumber.country_code

    assert_equal '+254', phone_number[0..3]
  end

  def test_en_ke_cell_phone_starts_with_0
    cell_number = Faker::PhoneNumber.cell_phone

    assert_equal '0', cell_number[0]
  end
end
