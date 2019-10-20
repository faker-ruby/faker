# frozen_string_literal: true

require_relative 'test_helper'

class TestZhCnLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'zh-CN'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_zh_cn_address_methods
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert_equal('中国', Faker::Address.default_country)
  end

  def test_zh_cn_name_methods
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert_no_match(/\s/, Faker::Name.name_with_middle)
  end

  def test_phone_number_methods
    assert Faker::PhoneNumber.phone_number.is_a? String

    cn_cell_phone_validation_regex = /^1(3[0-9]|4[57]|5[0-35-9]|7[0-35-8]|8[0-9])\d{8}$/
    assert_match(cn_cell_phone_validation_regex, Faker::PhoneNumber.cell_phone)
  end

  def test_zh_cn_university_methods
    assert Faker::University.prefix.is_a? String
    assert Faker::University.suffix.is_a? String
    assert Faker::University.name.is_a? String
  end
end
