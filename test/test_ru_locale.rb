require_relative 'test_helper'

class TestRuLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ru'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ru_methods
    assert Faker::Address.country.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.street_title.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_title.is_a? String
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.male_middle_name.is_a? String
    assert Faker::Name.male_last_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.female_middle_name.is_a? String
    assert Faker::Name.female_middle_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Commerce.color.is_a? String
    assert Faker::Commerce.department.is_a? String
    assert Faker::Commerce.product_name.is_a? String
    assert Faker::Company.prefix.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Char.romanize_cyrillic('').is_a? String
  end

  def test_ru_default_country
    assert_equal 'Россия', Faker::Address.default_country
  end
end
