# frozen_string_literal: true

require_relative 'test_helper'

class TestLtLocale < Test::Unit::TestCase
  def setup
    @phone_prefixes = %w[51 52 53 54 55 56 57 58 59 61 62 63 64 65 66 67
                         68 69 71 72 73 74 75 76 77 78 79].sort
    @cell_prefixes  = %w[21 22 23 24 25 26 27 28 29].sort
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'lt'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_lt_zip_codes
    expected = /LT\-\d{5}/
    assert_match(expected, Faker::Address.zip_code)
  end

  def test_lt_phone_number
    prefixes = (0..999).map { Faker::PhoneNumber.phone_number[0, 2] }.uniq.sort
    assert_equal @phone_prefixes, prefixes
  end

  def test_lt_cell_phone
    prefixes = (0..999).map { Faker::PhoneNumber.cell_phone[0, 2] }.uniq.sort
    assert_equal @cell_prefixes, prefixes
  end

  def test_lt_address_methods
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert_equal 'Lithuania', Faker::Address.default_country
    assert_equal 'LT', Faker::Address.country_code

    expected = /LT-\d{5}/
    assert_match(expected, Faker::Address.postcode)
  end

  def test_lt_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.buzzwords.is_a? Array
    assert Faker::Company.bs.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_lt_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_lt_name_methods
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.male_last_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.female_last_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end
end
