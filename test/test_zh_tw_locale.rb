# frozen_string_literal: true

require_relative 'test_helper'

class TestZhLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'zh-TW'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_zh_tw_address_methods
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
  end

  def test_zh_tw_name_methods
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_no_match(/\s/, Faker::Name.name_with_middle)
  end

  def test_zh_tw_university_methods
    assert_kind_of String, Faker::University.prefix
    assert_kind_of String, Faker::University.suffix
    assert_kind_of String, Faker::University.name
  end
end
