# frozen_string_literal: true

require_relative 'test_helper'

class TestEnNepLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-NEP'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_nep_address_methods
    assert_kind_of String, Faker::Address.default_time_zone
    assert_kind_of String, Faker::Address.default_country_code
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.default_country
  end

  def test_en_nep_company_methods
    assert_kind_of String, Faker::Company.suffix
  end

  def test_en_nep_name_methods
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.middle_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_equal 'Nepal', Faker::Address.default_country
  end

  def test_en_nep_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end
end
