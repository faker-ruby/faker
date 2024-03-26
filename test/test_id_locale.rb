# frozen_string_literal: true

require_relative 'test_helper'

class TestIdLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'id'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_id_address_methods
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.province
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.street_title
    assert_kind_of String, Faker::Address.street_name
  end

  def test_id_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_id_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.phone_number
  end
end
