# frozen_string_literal: true

require_relative 'test_helper'

class TestItLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'it'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_it_address_methods
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert_equal('Italia', Faker::Address.default_country)
  end

  def test_it_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.buzzwords.is_a? Array
    assert Faker::Company.bs.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_it_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_it_name_methods
    assert Faker::Name.name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert_equal('.', Faker::Name.prefix[-1, 1])
  end

  def test_it_phone_number_methods
    assert Faker::PhoneNumber.phone_number.is_a? String
  end
end
