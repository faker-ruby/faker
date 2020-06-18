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
    assert Faker::Address.postcode.match?(/^[\d]{5}$/)
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.common_street_suffix.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.street_root.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert_equal('Sverige', Faker::Address.default_country)
  end

  def test_sv_commerce_methods
    assert Faker::Commerce.color.is_a? String
    assert Faker::Commerce.department.is_a? String
    assert Faker::Commerce.product_name.is_a? String
  end

  def test_sv_company_methods
    assert Faker::Company.name.is_a? String
    assert Faker::Company.suffix.is_a? String
  end

  def test_sv_internet_methods
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_sv_name_methods
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.male_first_name.is_a? String
  end

  def test_sv_phone_number_methods
    assert Faker::PhoneNumber.cell_phone.match?(/^07[036]{1}[\-\s]?\d{3}[\-\s]?\d{4}$/)
    assert Faker::PhoneNumber.phone_number.match?(/^\d{4}[\s\-]?\d{4,6}$/)
  end

  def test_sv_team_methods
    assert Faker::Team.suffix.is_a? String
    assert Faker::Team.name.is_a? String
  end
end
