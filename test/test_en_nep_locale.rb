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
    assert Faker::Address.default_time_zone.is_a? String
    assert Faker::Address.default_country_code.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.default_country.is_a? String
  end

  def test_en_nep_company_methods
    assert Faker::Company.suffix.is_a? String
  end

  def test_en_nep_name_methods
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.middle_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert_equal 'Nepal', Faker::Address.default_country
  end

  def test_en_nep_internet_methods
    assert Faker::Internet.email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end
end
