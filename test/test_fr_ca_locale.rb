# frozen_string_literal: true

require_relative 'test_helper'

class TestFrCaLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale

    Faker::Config.locale = 'fr-CA'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_address_methods
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.country_code.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert_match(/^\d+$/, Faker::Address.building_number)
  end

  def test_book_methods
    assert Faker::Book.title.is_a? String
    assert Faker::Book.author.is_a? String
    assert Faker::Book.publisher.is_a? String
    assert Faker::Book.quote.is_a? String
  end

  def test_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.buzzword.is_a? String
    assert Faker::Company.bs.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_lorem_methods
    assert Faker::Lorem.word.is_a? String
  end

  def test_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.title.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_phone_number_methods
    assert Faker::PhoneNumber.area_code.is_a? String
    assert Faker::PhoneNumber.exchange_code.is_a? String
    assert Faker::PhoneNumber.phone_number.is_a? String
    assert Faker::PhoneNumber.cell_phone.is_a? String
  end
end
