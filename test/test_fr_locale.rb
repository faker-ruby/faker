# frozen_string_literal: true

require_relative 'test_helper'

class TestFrLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'fr'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_fr_address_methods
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert_match(/^[\d]{5}$/, Faker::Address.postcode)
    assert_match(/^\d+$/, Faker::Address.building_number)
    assert_equal('France', Faker::Address.default_country)
  end

  def test_fr_appliance_methods
    assert Faker::Appliance.equipment.is_a? String
  end

  def test_fr_book_methods
    assert Faker::Book.title.is_a? String
    assert Faker::Book.author.is_a? String
    assert Faker::Book.publisher.is_a? String
    assert Faker::Book.quote.is_a? String
  end

  def test_fr_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.buzzword.is_a? String
    assert Faker::Company.bs.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_fr_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_fr_lorem_methods
    assert Faker::Lorem.word.is_a? String
    assert Faker::Lorem.words(1000)
    assert Faker::Lorem.words(10_000, true)
  end

  def test_fr_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.title.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_fr_phone_number_methods
    assert Faker::PhoneNumber.phone_number.is_a? String
    assert Faker::PhoneNumber.cell_phone.is_a? String
  end

  def test_fr_phone_format
    phone = Faker::PhoneNumber.phone_number.gsub(/\D/, '')
    assert_match(/^(0|33)([1-5]|[8-9])\d{8}$/, phone)
  end

  def test_fr_cell_phone_format
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')
    assert_match(/^(0|33)(6|7)\d{8}$/, mobile)
  end

  def test_fr_pokemon_methods
    assert Faker::Pokemon.name.is_a? String
    assert Faker::Pokemon.location.is_a? String
    assert Faker::Pokemon.move.is_a? String
  end
end
