# frozen_string_literal: true

require_relative 'test_helper'

class TestUkLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'uk'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_uk_zipcode_length
    assert_match(/^\d{5}$/, Faker::Address.zip_code)
    assert_send([Faker::Address, :street_prefix])
  end

  def test_uk_address_absent
    assert_nil(Faker::Address.city_prefix)
    assert_nil(Faker::Address.city_suffix)
    assert_nil(Faker::Address.state_abbr)
  end

  def test_uk_romanize_cyrillic
    assert_kind_of String, Faker::Char.romanize_cyrillic('')
  end

  def test_uk_company_prefix_returns_true_value
    assert_send([Faker::Company, :prefix])
  end

  def test_uk_commerce_methods
    assert_kind_of String, Faker::Commerce.color
    assert_kind_of String, Faker::Commerce.product_name
    assert_kind_of String, Faker::Commerce.department
  end

  def test_uk_internet_methods
    assert_match(/.+@[^.].+\.\w+/, Faker::Internet.email)
    assert_match(/^[\w-]+$/, Faker::Internet.domain_word)
  end

  def test_uk_name_methods
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.male_middle_name
    assert_kind_of String, Faker::Name.male_last_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.female_middle_name
    assert_kind_of String, Faker::Name.female_last_name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name
  end
end
