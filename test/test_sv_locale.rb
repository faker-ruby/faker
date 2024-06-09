# frozen_string_literal: true

require_relative 'test_helper'

class TestSVLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'sv'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_address_methods
    assert_match(/^\d{5}$/, Faker::Address.postcode)
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.common_street_suffix
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.street_root
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.street_address
    assert_equal('Sverige', Faker::Address.default_country)
  end

  def test_sv_commerce_methods
    assert_kind_of String, Faker::Commerce.color
    assert_kind_of String, Faker::Commerce.department
    assert_kind_of String, Faker::Commerce.product_name
  end

  def test_sv_company_methods
    assert_kind_of String, Faker::Company.name
    assert_kind_of String, Faker::Company.suffix
  end

  def test_sv_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_sv_name_methods
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.male_first_name
  end

  def test_sv_phone_number_methods
    assert_match(/^07[036]{1}[-\s]?\d{3}[-\s]?\d{4}$/, Faker::PhoneNumber.cell_phone)
    assert_match(/^\d{4}[\s-]?\d{4,6}$/, Faker::PhoneNumber.phone_number)
  end

  def test_sv_team_methods
    assert_kind_of String, Faker::Team.suffix
    assert_kind_of String, Faker::Team.name
  end

  def test_sv_bank_methods
    assert_kind_of String, Faker::Bank.name
  end

  def test_sv_sport_methods
    assert_kind_of String, Faker::Sport.summer_olympics_sport
    assert_kind_of String, Faker::Sport.winter_olympics_sport
    assert_kind_of String, Faker::Sport.summer_paralympics_sport
    assert_kind_of String, Faker::Sport.winter_paralympics_sport
  end
end
