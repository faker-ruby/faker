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
    assert Faker::Address.city.is_a? String
    assert Faker::Address.country.is_a? String
    assert_equal('Turkey', Faker::Address.default_country)
  end

  def test_tr_book_fields
    assert Faker::Book.title.is_a? String
    assert Faker::Book.author.is_a? String
    assert Faker::Book.publisher.is_a? String
    assert Faker::Book.quote.is_a? String
  end

  def test_tr_internet_fields
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Internet.safe_email.is_a? String
  end

  def test_tr_names
    assert Faker::Name.name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.title.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_tr_phone_number_fields
    assert Faker::PhoneNumber.phone_number.is_a? String
  end
end
