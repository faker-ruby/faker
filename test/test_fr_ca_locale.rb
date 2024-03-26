# frozen_string_literal: true

require_relative 'test_helper'

class TestFrCaLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    @standard_wordlist = I18n.translate('faker.lorem.words')
    @complete_wordlist =
      @standard_wordlist + I18n.translate('faker.lorem.supplemental')

    Faker::Config.locale = 'fr-CA'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_fr_ca_address_methods
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.country_code
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.default_country
    assert_match(/^\d+$/, Faker::Address.building_number)
    assert_equal('Canada', Faker::Address.default_country)
  end

  def test_fr_ca_book_methods
    assert_kind_of String, Faker::Book.title
    assert_kind_of String, Faker::Book.author
    assert_kind_of String, Faker::Book.publisher
    assert_kind_of String, Faker::Book.quote
  end

  def test_fr_ca_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.buzzword
    assert_kind_of String, Faker::Company.bs
    assert_kind_of String, Faker::Company.name
  end

  def test_fr_ca_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_fr_ca_lorem_methods
    assert_kind_of String, Faker::Lorem.word
    assert Faker::Lorem.words(number: 1000)
    assert Faker::Lorem.words(number: 10_000, supplemental: true)
  end

  def test_fr_ca_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_fr_ca_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.area_code
    assert_kind_of String, Faker::PhoneNumber.exchange_code
    assert_kind_of String, Faker::PhoneNumber.phone_number
    assert_kind_of String, Faker::PhoneNumber.cell_phone
  end

  def test_fr_ca_pokemon_methods
    assert_kind_of String, Faker::Games::Pokemon.name
    assert_kind_of String, Faker::Games::Pokemon.location
    assert_kind_of String, Faker::Games::Pokemon.move
  end
end
