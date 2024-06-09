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
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.default_country
    assert_equal('中国', Faker::Address.default_country)
  end

  def test_zh_cn_name_methods
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_no_match(/\s/, Faker::Name.name_with_middle)
  end

  def test_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.phone_number

    cn_cell_phone_validation_regex = /^1(3[0-9]|4[57]|5[0-35-9]|7[0-35-8]|8[0-9])\d{8}$/

    assert_match(cn_cell_phone_validation_regex, Faker::PhoneNumber.cell_phone)
  end

  def test_zh_cn_university_methods
    assert_kind_of String, Faker::University.prefix
    assert_kind_of String, Faker::University.suffix
    assert_kind_of String, Faker::University.name
  end
end
