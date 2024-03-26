# frozen_string_literal: true

require_relative 'test_helper'

class TestTRLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'tr'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_tr_address_fields
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.country
    assert_equal('Turkey', Faker::Address.default_country)
  end

  def test_tr_book_fields
    assert_kind_of String, Faker::Book.title
    assert_kind_of String, Faker::Book.author
    assert_kind_of String, Faker::Book.publisher
    assert_kind_of String, Faker::Book.quote
  end

  def test_tr_internet_fields
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
    assert_kind_of String, Faker::Internet.email
  end

  def test_tr_names
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_tr_phone_number_fields
    assert_kind_of String, Faker::PhoneNumber.phone_number
  end
end
