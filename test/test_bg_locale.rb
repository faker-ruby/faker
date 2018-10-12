# frozen_string_literal: true

require_relative 'test_helper'

class TestBgLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'bg'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_bg_methods
    assert Faker::Address.country.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.street_title.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_title.is_a? String
    assert_equal 'България', Faker::Address.default_country
  end

  def test_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.male_middle_name.is_a? String
    assert Faker::Name.male_last_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.female_middle_name.is_a? String
    assert Faker::Name.female_middle_name.is_a? String
    assert Faker::Name.name.is_a? String
  end

  def test_phone_number_methods
    assert Faker::PhoneNumber.cell_phone.is_a? String
  end

  def test_cell_number_starts_wiht_08
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')
    assert_equal '08', mobile[0] + mobile[1]
  end
end
