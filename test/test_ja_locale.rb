# frozen_string_literal: true

require_relative 'test_helper'

class TestJaLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ja'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ja_address_methods
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
  end

  def test_ja_cat_methods
    assert Faker::Cat.breed.is_a? String
  end

  def test_ja_color_methods
    assert Faker::Color.name.is_a? String
  end

  def test_ja_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.category.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_ja_dog_methods
    assert Faker::Dog.breed.is_a? String
  end

  def test_ja_food_methods
    assert Faker::Food.sushi.is_a? String
  end

  def test_ja_gender_methods
    assert Faker::Gender.binary_type.is_a? String
  end

  def test_ja_lorem_methods
    assert Faker::Lorem.words.is_a? Array
    assert Faker::Lorem.words(1000)
    assert Faker::Lorem.words(10_000, true)
  end

  def test_ja_name_methods
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.suffix.is_a? String
    assert Faker::Name.prefix.is_a? String
  end

  def test_ja_phone_number_methods
    assert Faker::PhoneNumber.cell_phone.is_a? String
    assert Faker::PhoneNumber.phone_number.is_a? String
  end

  def test_ja_pokemon_methods
    assert Faker::Games::Pokemon.name.is_a? String
    assert Faker::Games::Pokemon.location.is_a? String
    assert Faker::Games::Pokemon.move.is_a? String
  end

  def test_ja_zelda_methods
    assert Faker::Games::Zelda.game.is_a? String
  end

  def test_ja_restaurant_methods
    assert Faker::Restaurant.name.is_a? String
    assert Faker::Restaurant.type.is_a? String
  end

  def test_ja_space_methods
    assert Faker::Space.planet.is_a? String
    assert Faker::Space.galaxy.is_a? String
  end

  def test_ja_university_methods
    assert Faker::University.prefix.is_a? String
    assert Faker::University.suffix.is_a? String
    assert Faker::University.name.is_a? String
  end
end
