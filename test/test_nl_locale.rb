# frozen_string_literal: true

require_relative 'test_helper'

class TestNlLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'nl'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_nl_address_methods
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.default_country
    assert_match(/\A[1-9][0-9]{3} [A-Z]{2}(?<!SA|SS|SD)\z/, Faker::Address.postcode)
    assert_equal('Nederland', Faker::Address.default_country)
  end

  def test_nl_book_methods
    assert_kind_of String, Faker::Book.title
    assert_kind_of String, Faker::Book.author
    assert_kind_of String, Faker::Book.publisher
  end

  def test_nl_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.buzzword
    assert_kind_of String, Faker::Company.bs
    assert_kind_of String, Faker::Company.name
  end

  def test_nl_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_nl_lorem_methods
    assert_kind_of String, Faker::Lorem.word
  end

  def test_nl_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.tussenvoegsel
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.suffix
  end

  def test_nl_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.phone_number
    assert_kind_of String, Faker::PhoneNumber.cell_phone
  end

  def test_nl_university_methods
    assert_kind_of String, Faker::University.prefix
    assert_kind_of String, Faker::University.name
  end
end
