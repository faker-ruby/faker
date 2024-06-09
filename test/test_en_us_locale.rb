# frozen_string_literal: true

require_relative 'test_helper'

class TestEnUsLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-US'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_us_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_en_us_address_methods
    assert_kind_of String, Faker::Address.full_address
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.country_code
    assert_kind_of String, Faker::Address.full_address
  end

  def test_en_us_subscriber_number_method
    assert_kind_of String, Faker::PhoneNumber.subscriber_number
    assert_equal(4, Faker::PhoneNumber.subscriber_number.length)
    assert_equal(10, Faker::PhoneNumber.subscriber_number(length: 10).length)
    assert_equal Faker::PhoneNumber.method(:extension), Faker::PhoneNumber.method(:subscriber_number)
  end

  def test_en_us_phone_methods_with_en_us_locale
    assert_kind_of String, Faker::PhoneNumber.area_code
    assert_kind_of Integer, Faker::PhoneNumber.area_code.to_i
    assert_equal(3, Faker::PhoneNumber.area_code.length)

    assert_kind_of String, Faker::PhoneNumber.exchange_code
    assert_kind_of Integer, Faker::PhoneNumber.exchange_code.to_i
    assert_equal(3, Faker::PhoneNumber.exchange_code.length)
  end

  def test_validity_of_phone_method_output
    # got the following regex from http://stackoverflow.com/a/123666/1210055 as an expression of the NANP standard.
    us_number_validation_regex = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/

    assert_match(us_number_validation_regex, Faker::PhoneNumber.phone_number)
  end

  def test_en_us_invalid_state_raises_exception
    assert_raise(I18n::MissingTranslationData) { Faker::Address.zip_code(state_abbreviation: 'NA') }
  end

  def test_en_us_zip_codes_match_state
    state_abbr = 'AZ'
    expected = /^850\d\d$/

    assert_match(expected, Faker::Address.zip_code(state_abbreviation: state_abbr))

    # disjointed ranges for these states
    # http://www.fincen.gov/forms/files/us_state_territory_zip_codes.pdf
    state_abbr = 'AR'
    expected = /^717\d\d$/

    assert_match(expected, Faker::Address.zip_code(state_abbreviation: state_abbr))
    state_abbr = 'GA'
    expected = /^301\d\d$/

    assert_match(expected, Faker::Address.zip_code(state_abbreviation: state_abbr))
    state_abbr = 'MA'
    expected = /^026\d\d$/

    assert_match(expected, Faker::Address.zip_code(state_abbreviation: state_abbr))
    state_abbr = 'NY'
    expected = /^122\d\d$/

    assert_match(expected, Faker::Address.zip_code(state_abbreviation: state_abbr))
    state_abbr = 'TX'
    expected = /^798\d\d$/

    assert_match(expected, Faker::Address.zip_code(state_abbreviation: state_abbr))
    state_abbr = 'VA'
    expected = /^222\d\d$/

    assert_match(expected, Faker::Address.zip_code(state_abbreviation: state_abbr))
  end

  def test_en_us_valid_id_number
    id_num = Faker::IdNumber.valid

    assert(Faker::IdNumber::INVALID_SSN.none? { |regex| id_num =~ regex })
  end

  def test_en_us_invalid_id_number
    id_num = Faker::IdNumber.invalid

    assert(Faker::IdNumber::INVALID_SSN.any? { |regex| id_num =~ regex })
  end
end
