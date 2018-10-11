# frozen_string_literal: true

require_relative 'test_helper'

class TestSKLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'sk'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_sk_methods
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.time_zone.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert_equal 'Slovensko', Faker::Address.default_country
  end

  def test_company_methods
    assert Faker::Company.suffix.is_a? String
  end

  def test_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_name_methods
    assert Faker::Name.man_first_name.is_a? String
    assert Faker::Name.woman_first_name.is_a? String
    assert Faker::Name.man_last_name.is_a? String
    assert Faker::Name.woman_last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.suffix.is_a? String
    assert Faker::Name.title.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end
end
