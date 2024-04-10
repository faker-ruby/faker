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
    assert_kind_of String, Faker::Address.postcode
    assert_equal(5, Faker::Address.postcode.length)
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_root
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.default_country
    assert_equal('대한민국', Faker::Address.default_country)
  end

  def test_ko_adjective_methods
    assert_kind_of String, Faker::Adjective.positive
    assert_kind_of String, Faker::Adjective.negative
  end

  def test_ko_animal_methods
    assert_kind_of String, Faker::Creature::Animal.name
  end

  def test_ko_color_methods
    assert_kind_of String, Faker::Color.color_name
  end

  def test_ko_commerce_methods
    assert_kind_of String, Faker::Commerce.department
    assert_kind_of String, Faker::Commerce.product_name
    assert_kind_of String, Faker::Commerce.promotion_code
    assert_kind_of String, Faker::Commerce.material
  end

  def test_ko_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.prefix
    assert_kind_of String, Faker::Company.name
  end

  def test_ko_dessert_methods
    assert_kind_of String, Faker::Dessert.variety
    assert_kind_of String, Faker::Dessert.topping
    assert_kind_of String, Faker::Dessert.flavor
  end

  def test_ko_gender_methods
    assert_kind_of String, Faker::Gender.binary_type
    assert_not_english(Faker::Gender.binary_type)
  end

  def test_ko_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_ko_lorem_methods
    assert_kind_of Array, Faker::Lorem.words
  end

  def test_ko_name_methods
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_ko_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.phone_number
  end

  def test_ko_space_methods
    assert_kind_of String, Faker::Space.planet
    assert_kind_of String, Faker::Space.galaxy
  end
end
