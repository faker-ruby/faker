# frozen_string_literal: true

require_relative 'test_helper'

class TestCaCatLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ca-CAT'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ca_cat_address_methods
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.province
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.default_country
    assert_equal 'Catalunya', Faker::Address.default_country
  end

  def test_ca_cat_phone_numbers_start_with_9
    mobile = Faker::PhoneNumber.phone_number.gsub(/\D/, '')

    assert_equal '9', mobile[0]
  end

  def test_ca_cat_cell_numbers_start_with_6
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')

    assert_equal '6', mobile[0]
  end
end
