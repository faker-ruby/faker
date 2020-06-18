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
    assert Faker::Address.zip_code.match?(/^\d{5}$/)
    assert_send([Faker::Address, :street_prefix])
  end

  def test_uk_address_absent
    assert_equal(nil, Faker::Address.city_prefix)
    assert_equal(nil, Faker::Address.city_suffix)
    assert_equal(nil, Faker::Address.state_abbr)
  end

  def test_uk_romanize_cyrillic
    assert Faker::Char.romanize_cyrillic('').is_a? String
  end

  def test_uk_company_prefix_returns_true_value
    assert_send([Faker::Company, :prefix])
  end

  def test_uk_commerce_methods
    assert Faker::Commerce.color.is_a? String
    assert Faker::Commerce.product_name.is_a? String
    assert Faker::Commerce.department.is_a? String
  end

  def test_uk_internet_methods
    assert Faker::Internet.email.match?(/.+@[^.].+\.\w+/)
    assert Faker::Internet.domain_word.match?(/^[\w-]+$/)
  end

  def test_uk_name_methods
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.male_middle_name.is_a? String
    assert Faker::Name.male_last_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.female_middle_name.is_a? String
    assert Faker::Name.female_last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name.is_a? String
  end
end
