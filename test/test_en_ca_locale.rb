# frozen_string_literal: true

require_relative 'test_helper'

class TestEnCaLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-CA'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_ca_address_methods
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.default_country
    assert_equal 'Canada', Faker::Address.default_country

    expected = /[A-VX-Y][0-9][A-CEJ-NPR-TV-Z] ?[0-9][A-CEJ-NPR-TV-Z][0-9]/

    assert_match(expected, Faker::Address.postcode)
  end

  def test_en_ca_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_en_ca_subscriber_number_method
    assert_kind_of String, Faker::PhoneNumber.subscriber_number
    assert_equal(4, Faker::PhoneNumber.subscriber_number.length)
    assert_equal(10, Faker::PhoneNumber.subscriber_number(length: 10).length)
    assert_equal Faker::PhoneNumber.method(:extension), Faker::PhoneNumber.method(:subscriber_number)
  end

  def test_en_ca_phone_methods
    assert_kind_of String, Faker::PhoneNumber.area_code
    assert_kind_of Integer, Faker::PhoneNumber.area_code.to_i
    assert_equal(3, Faker::PhoneNumber.area_code.length)

    assert_kind_of String, Faker::PhoneNumber.exchange_code
    assert_kind_of Integer, Faker::PhoneNumber.exchange_code.to_i
    assert_equal(3, Faker::PhoneNumber.exchange_code.length)

    assert_equal('+1', Faker::PhoneNumber.country_code)
    assert_kind_of(String, Faker::PhoneNumber.area_code)
    assert_kind_of(String, Faker::PhoneNumber.exchange_code)
  end

  def test_validity_of_phone_method_output
    # got the following regex from http://stackoverflow.com/a/123666/1210055 as an expression of the NANP standard.
    ca_number_validation_regex = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/

    assert_match(ca_number_validation_regex, Faker::PhoneNumber.phone_number)
  end
end
