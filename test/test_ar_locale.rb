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
    assert Faker::Address.country.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.full_address.is_a? String
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.full_address.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert_equal('المملكة العربية السعودية', Faker::Address.default_country)
  end

  def test_ar_app_methods
    assert Faker::App.name.is_a? String
    assert Faker::App.version.is_a? String
    assert Faker::App.author.is_a? String
  end

  def test_ar_book_methods
    assert Faker::Book.title.is_a? String
    assert Faker::Book.author.is_a? String
    assert Faker::Book.publisher.is_a? String
    assert Faker::Book.genre.is_a? String
  end

  def test_ar_color_name
    assert Faker::Color.color_name.is_a? String
  end

  def test_ar_commerce_methods
    assert Faker::Commerce.department.is_a? String
    assert Faker::Commerce.product_name.is_a? String
    assert Faker::Commerce.promotion_code.is_a? String
  end

  def test_ar_company_methods
    assert Faker::Company.name.is_a? String
    assert Faker::Company.industry.is_a? String
    assert Faker::Company.profession.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.buzzword.is_a? String
    assert Faker::Company.bs.is_a? String
  end

  def test_ar_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.prefix.is_a? String
  end

  def test_ar_team_methods
    assert Faker::Team.creature.is_a? String
    assert Faker::Team.name.is_a? String
    assert Faker::Team.sport.is_a? String
  end

  def test_ar_university_methods
    assert Faker::University.name.is_a? String
    assert Faker::University.prefix.is_a? String
    assert Faker::University.suffix.is_a? String
  end
end
