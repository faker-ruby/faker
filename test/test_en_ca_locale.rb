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
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert_equal 'Canada', Faker::Address.default_country
    assert_equal 'CA', Faker::Address.country_code

    expected = /[A-VX-Y][0-9][A-CEJ-NPR-TV-Z] ?[0-9][A-CEJ-NPR-TV-Z][0-9]/
    assert_match(expected, Faker::Address.postcode)
  end

  def test_en_ca_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_en_ca_subscriber_number_method
    assert Faker::PhoneNumber.subscriber_number.is_a? String
    assert_equal Faker::PhoneNumber.subscriber_number.length, 4
    assert_equal Faker::PhoneNumber.subscriber_number(length: 10).length, 10
    assert_equal Faker::PhoneNumber.method(:extension), Faker::PhoneNumber.method(:subscriber_number)
  end

  def test_en_ca_phone_methods
    assert Faker::PhoneNumber.area_code.is_a? String
    assert Faker::PhoneNumber.area_code.to_i.is_a? Integer
    assert_equal Faker::PhoneNumber.area_code.length, 3

    assert Faker::PhoneNumber.exchange_code.is_a? String
    assert Faker::PhoneNumber.exchange_code.to_i.is_a? Integer
    assert_equal Faker::PhoneNumber.exchange_code.length, 3
  end

  def test_validity_of_phone_method_output
    # got the following regex from http://stackoverflow.com/a/123666/1210055 as an expression of the NANP standard.
    ca_number_validation_regex = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/
    assert_match(ca_number_validation_regex, Faker::PhoneNumber.phone_number)
  end

  def test_en_ca_phone_methods_return_nil_for_nil_locale
    Faker::Config.locale = nil

    assert_nil Faker::PhoneNumber.area_code
    assert_nil Faker::PhoneNumber.exchange_code
  end
end
