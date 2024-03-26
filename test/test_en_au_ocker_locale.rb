# frozen_string_literal: true

require_relative 'test_helper'

class TestEnAuOckerLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-au-ocker'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_au_address_methods
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_root
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.region
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.default_country
    assert_equal('Australia', Faker::Address.default_country)
  end

  def test_en_au_company_methods
    assert_kind_of String, Faker::Company.suffix
  end

  def test_en_au_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_en_au_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.ocker_first_name
  end

  def test_en_au_cell_phone_method
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')

    assert_equal '0', mobile[0]
    assert_equal '4', mobile[1]
  end
end
