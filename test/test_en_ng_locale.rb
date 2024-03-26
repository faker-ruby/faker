# frozen_string_literal: true

require_relative 'test_helper'

class TestEnNgLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-NG'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_ng_address_methods
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.region
    assert_kind_of String, Faker::Address.lga
    assert_equal 'Nigeria', Faker::Address.default_country
  end

  def test_en_ng_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_en_ng_phonenumber_is_11_digits
    phone_number = Faker::PhoneNumber.phone_number

    assert_equal 11, phone_number.length
  end

  def test_en_ng_phonenumber_starts_with_0
    phone_number = Faker::PhoneNumber.phone_number

    assert_equal '0', phone_number[0]
  end
end
