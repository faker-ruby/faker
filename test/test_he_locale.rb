# frozen_string_literal: true

require_relative 'test_helper'

class TestHeLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'he'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_he_address_methods
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert_equal('ישראל', Faker::Address.default_country)
  end

  def test_he_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.name.is_a? String
  end
end
