# frozen_string_literal: true

require_relative 'test_helper'

class TestEnNzLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-NZ'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_address_methods
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.region.is_a? String
    assert Faker::Address.region_abbr.is_a? String
    assert_equal 'New Zealand', Faker::Address.default_country
  end

  def test_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_phone_number_methods
    cellphone = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')
    assert_equal '0', cellphone[0]
    assert_equal '2', cellphone[1]
  end

  def test_team_methods
    assert Faker::Team.sport.is_a? String
    assert Faker::Team.name.is_a? String
  end

  def test_university_methods
    assert Faker::University.name.is_a? String
  end
end
