# frozen_string_literal: true

require_relative 'test_helper'

class TestArLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = :ar
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ar_address_methods
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.full_address
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.full_address
    assert_kind_of String, Faker::Address.default_country
    assert_equal('المملكة العربية السعودية', Faker::Address.default_country)
  end

  def test_ar_app_methods
    assert_kind_of String, Faker::App.name
    assert_kind_of String, Faker::App.version
    assert_kind_of String, Faker::App.author
  end

  def test_ar_book_methods
    assert_kind_of String, Faker::Book.title
    assert_kind_of String, Faker::Book.author
    assert_kind_of String, Faker::Book.publisher
    assert_kind_of String, Faker::Book.genre
  end

  def test_ar_color_name
    assert_kind_of String, Faker::Color.color_name
  end

  def test_ar_commerce_methods
    assert_kind_of String, Faker::Commerce.department
    assert_kind_of String, Faker::Commerce.product_name
    assert_kind_of String, Faker::Commerce.promotion_code
  end

  def test_ar_company_methods
    assert_kind_of String, Faker::Company.name
    assert_kind_of String, Faker::Company.industry
    assert_kind_of String, Faker::Company.profession
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.buzzword
    assert_kind_of String, Faker::Company.bs
  end

  def test_ar_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.prefix
  end

  def test_ar_team_methods
    assert_kind_of String, Faker::Team.creature
    assert_kind_of String, Faker::Team.name
    assert_kind_of String, Faker::Team.sport
  end

  def test_ar_university_methods
    assert_kind_of String, Faker::University.name
    assert_kind_of String, Faker::University.prefix
    assert_kind_of String, Faker::University.suffix
  end
end
