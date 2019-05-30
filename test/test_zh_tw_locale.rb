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
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
  end

  def test_zh_tw_name_methods
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert_no_match(/\s/, Faker::Name.name_with_middle)
  end

  def test_zh_tw_university_methods
    assert Faker::University.prefix.is_a? String
    assert Faker::University.suffix.is_a? String
    assert Faker::University.name.is_a? String
  end
end
