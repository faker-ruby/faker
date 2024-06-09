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
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.default_country
    assert_equal('ישראל', Faker::Address.default_country)
  end

  def test_he_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.name
  end
end
