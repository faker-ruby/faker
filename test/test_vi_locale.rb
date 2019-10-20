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
    assert Faker::Address.city_root.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.county.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Address.city_root.is_a? String
    assert Faker::Address.city_root.is_a? String
    assert_equal('Việt Nam', Faker::Address.default_country)
  end

  def test_vi_company_methods
    assert Faker::Company.prefix.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_vi_lorem_methods
    assert Faker::Lorem.word.is_a? String
  end

  def test_vi_internet_methods
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_vi_phone_number_methods
    assert Faker::PhoneNumber.phone_number.is_a? String
    assert Faker::PhoneNumber.cell_phone.is_a? String
  end

  def test_vi_name_methods
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name.is_a? String
  end
end
