# frozen_string_literal: true

require_relative 'test_helper'

class TestKoLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ko'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ko_address_methods
    assert Faker::Address.postcode.is_a? String
    assert_equal(5, Faker::Address.postcode.length)
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_root.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert_equal('대한민국', Faker::Address.default_country)
  end

  def test_ko_color_methods
    assert Faker::Color.color_name.is_a? String
  end

  def test_ko_commerce_methods
    assert Faker::Commerce.department.is_a? String
    assert Faker::Commerce.product_name.is_a? String
    assert Faker::Commerce.promotion_code.is_a? String
    assert Faker::Commerce.material.is_a? String
  end

  def test_ko_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.prefix.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_ko_gender_methods
    assert Faker::Gender.binary_type.is_a? String
    assert_not_english(Faker::Gender.binary_type)
  end

  def test_ko_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_ko_lorem_methods
    assert Faker::Lorem.words.is_a? Array
  end

  def test_ko_name_methods
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_ko_phone_number_methods
    assert Faker::PhoneNumber.phone_number.is_a? String
  end

  def test_ko_space_methods
    assert Faker::Space.planet.is_a? String
    assert Faker::Space.galaxy.is_a? String
  end
end
