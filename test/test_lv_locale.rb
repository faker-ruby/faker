# frozen_string_literal: true

require_relative 'test_helper'

class TestLvLocale < Test::Unit::TestCase
  def setup
    @phone_prefixes = %w[51 52 53 54 55 56 57 58 59 61 62 63 64 65 66 67
                         68 69 71 72 73 74 75 76 77 78 79].sort
    @cell_prefixes  = %w[21 22 23 24 25 26 27 28 29].sort
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = :lv
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_lv_phone_number
    prefixes = (0..999).map { Faker::PhoneNumber.phone_number[0, 2] }.uniq.sort

    assert_equal @phone_prefixes, prefixes
  end

  def test_lv_cell_phone
    prefixes = (0..999).map { Faker::PhoneNumber.cell_phone[0, 2] }.uniq.sort

    assert_equal @cell_prefixes, prefixes
  end

  def test_lv_address_methods
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
  end

  def test_lv_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of Array, Faker::Company.buzzwords
    assert_kind_of String, Faker::Company.bs
    assert_kind_of String, Faker::Company.name
  end

  def test_lv_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_lv_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.name_with_middle
  end
end
