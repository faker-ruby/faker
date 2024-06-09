# frozen_string_literal: true

require_relative 'test_helper'

class TestEnNzLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-NZ'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_nz_address_methods
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.region
    assert_kind_of String, Faker::Address.region_abbr
    assert_kind_of String, Faker::Address.postcode
    assert_equal 'New Zealand', Faker::Address.default_country
  end

  def test_en_nz_company_methods
    assert_kind_of String, Faker::Company.suffix
  end

  def test_en_nz_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_en_nz_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_en_nz_phone_number_methods
    cellphone = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')

    assert_equal '0', cellphone[0]
    assert_equal '2', cellphone[1]
  end

  def test_en_nz_team_methods
    assert_kind_of String, Faker::Team.sport
    assert_kind_of String, Faker::Team.name
  end

  def test_en_nz_university_methods
    assert_kind_of String, Faker::University.name
  end
end
