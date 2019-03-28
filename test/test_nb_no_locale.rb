# frozen_string_literal: true

require_relative 'test_helper'

class TestNbNoLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'nb-NO'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_nb_no_address_methods
    assert Faker::Address.city_root.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.street_root.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.common_street_suffix.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert_equal('Norge', Faker::Address.default_country)
  end

  def test_nb_no_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_nb_no_internet_methods
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_nb_no_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.suffix.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
  end

  def test_nb_no_phone_number_methods
    assert Faker::PhoneNumber.cell_phone.is_a? String
    assert Faker::PhoneNumber.phone_number.is_a? String
  end
end
