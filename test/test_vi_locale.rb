# frozen_string_literal: true

require_relative 'test_helper'

class TestViLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'vi'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_vi_address_methods
    assert_kind_of String, Faker::Address.city_root
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.county
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.city_root
    assert_kind_of String, Faker::Address.city_root
    assert_equal('Việt Nam', Faker::Address.default_country)
  end

  def test_vi_company_methods
    assert_kind_of String, Faker::Company.prefix
    assert_kind_of String, Faker::Company.name
  end

  def test_vi_lorem_methods
    assert_kind_of String, Faker::Lorem.word
  end

  def test_vi_internet_methods
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_vi_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.phone_number
    assert_kind_of String, Faker::PhoneNumber.cell_phone
  end

  def test_vi_name_methods
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
  end
end
