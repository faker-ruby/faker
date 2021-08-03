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
    # Added Actual Japanese Zipcodes in lib/locals/ja.yml
    assert_match(/\A\d{3}-\d{4}\z/, Faker::Address.postcode)
    assert_not_english(Faker::Address.postcode)
    assert Faker::Address.state.is_a? String
    assert_not_english(Faker::Address.state)
    assert Faker::Address.state_abbr.is_a? String
    assert_not_english(Faker::Address.state_abbr)
    assert Faker::Address.city_prefix.is_a? String
    assert_not_english(Faker::Address.city_prefix)
    assert Faker::Address.city_suffix.is_a? String
    assert_not_english(Faker::Address.city_suffix)
    assert Faker::Address.city.is_a? String
    assert_not_english(Faker::Address.city)
    assert Faker::Address.street_name.is_a? String
    assert_not_english(Faker::Address.street_name)
  end

  def test_ja_ancient_methods
    assert Faker::Ancient.god.is_a? String
    assert_not_english(Faker::Ancient.god)
  end

  def test_ja_cat_methods
    assert Faker::Creature::Cat.breed.is_a? String
    assert_not_match(/[a-zA-Z]/, Faker::Creature::Cat.breed)
  end

  def test_ja_color_methods
    assert Faker::Color.color_name.is_a? String
    assert_not_english(Faker::Color.color_name)
  end

  def test_ja_book_methods
    assert Faker::Book.title.is_a? String
    assert_not_english(Faker::Book.title)
    assert Faker::Book.author.is_a? String
    assert_not_english(Faker::Book.author)
    assert Faker::Book.publisher.is_a? String
    assert_not_english(Faker::Book.publisher)
    assert Faker::Book.genre.is_a? String
    assert_not_english(Faker::Book.genre)
  end

  def test_ja_coffee_methods
    assert Faker::Coffee.country.is_a? String
    assert_not_english(Faker::Coffee.country)
  end

  def test_ja_commerce_methods
    assert Faker::Commerce.department.is_a? String
    assert_not_english(Faker::Commerce.department)
    assert Faker::Commerce.product_name.is_a? String
    assert_not_english(Faker::Commerce.product_name)
    assert Faker::Commerce.promotion_code.is_a? String
    assert_not_english(Faker::Commerce.promotion_code)
  end

  def test_ja_company_methods
    assert Faker::Company.suffix.is_a? String
    assert_not_english(Faker::Company.suffix)
    assert Faker::Company.category.is_a? String
    assert_not_english(Faker::Company.category)
    assert Faker::Company.name.is_a? String
    assert_not_english(Faker::Company.name)
  end

  def test_ja_dog_methods
    assert Faker::Creature::Dog.breed.is_a? String
    assert_not_match(/[a-zA-Z]/, Faker::Creature::Dog.breed)
  end

  def test_ja_food_methods
    assert Faker::Food.sushi.is_a? String
    assert_not_english(Faker::Food.sushi)
  end

  def test_ja_gender_methods
    assert Faker::Gender.binary_type.is_a? String
    assert_not_english(Faker::Gender.binary_type)
  end

  def test_ja_lorem_methods
    assert Faker::Lorem.words.is_a? Array
    assert Faker::Lorem.words(number: 1000)
    assert Faker::Lorem.words(number: 10_000, supplemental: true)
    assert_not_match(/ /, Faker::Lorem.paragraph)
  end

  def test_ja_name_methods
    assert Faker::Name.last_name.is_a? String
    assert_not_english(Faker::Name.last_name)
    assert Faker::Name.first_name.is_a? String
    assert_not_english(Faker::Name.first_name)
    assert Faker::Name.name.is_a? String
    assert_not_english(Faker::Name.name)
    assert Faker::Name.name_with_middle.is_a? String
    assert_not_english(Faker::Name.name_with_middle)
  end

  def test_ja_phone_number_methods
    assert Faker::PhoneNumber.cell_phone.is_a? String
    assert_not_english(Faker::PhoneNumber.cell_phone)
    assert Faker::PhoneNumber.phone_number.is_a? String
    assert_not_english(Faker::PhoneNumber.phone_number)
  end

  def test_ja_overwatch_methods
    assert Faker::Games::Overwatch.hero.is_a? String
    assert_not_english(Faker::Games::Overwatch.hero)
  end

  def test_ja_pokemon_methods
    assert Faker::Games::Pokemon.name.is_a? String
    assert_not_english(Faker::Games::Pokemon.name)
    assert Faker::Games::Pokemon.location.is_a? String
    assert_not_english(Faker::Games::Pokemon.location)
    assert Faker::Games::Pokemon.move.is_a? String
    assert_not_english(Faker::Games::Pokemon.move)
  end

  def test_ja_supermario_methods
    assert Faker::Games::SuperMario.character.is_a? String
    assert_not_english(Faker::Games::SuperMario.character)
    assert Faker::Games::SuperMario.game.is_a? String
    assert_not_english(Faker::Games::SuperMario.game)
    assert Faker::Games::SuperMario.location.is_a? String
    assert_not_english(Faker::Games::SuperMario.location)
  end

  def test_ja_zelda_methods
    assert Faker::Games::Zelda.game.is_a? String
    assert_not_english(Faker::Games::Zelda.game)
  end

  def test_ja_restaurant_methods
    assert Faker::Restaurant.name.is_a? String
    assert_not_english(Faker::Restaurant.name)
    assert Faker::Restaurant.type.is_a? String
    assert_not_english(Faker::Restaurant.type)
  end

  def test_ja_space_methods
    assert Faker::Space.planet.is_a? String
    assert_not_english(Faker::Space.planet)
    assert Faker::Space.galaxy.is_a? String
  end

  def test_ja_studio_ghibli_methods
    assert Faker::JapaneseMedia::StudioGhibli.character.is_a? String
    assert_not_english(Faker::JapaneseMedia::StudioGhibli.character)
    assert Faker::JapaneseMedia::StudioGhibli.quote.is_a? String
    assert_not_english(Faker::JapaneseMedia::StudioGhibli.quote)
    assert Faker::JapaneseMedia::StudioGhibli.movie.is_a? String
    assert_not_english(Faker::JapaneseMedia::StudioGhibli.movie)
  end

  def test_ja_subscription_methods
    assert Faker::Subscription.plan.is_a? String
    assert_not_english(Faker::Subscription.plan)
    assert Faker::Subscription.status.is_a? String
    assert_not_english(Faker::Subscription.status)
    assert Faker::Subscription.payment_method.is_a? String
    assert Array.new(10) { Faker::Subscription.payment_method }.any? { |word| !word.match?(/[a-zA-Z]/) }
    assert Faker::Subscription.subscription_term.is_a? String
    assert_not_english(Faker::Subscription.subscription_term)
    assert Faker::Subscription.payment_term.is_a? String
    assert_not_english(Faker::Subscription.payment_term)
  end

  def test_ja_university_methods
    assert Faker::University.prefix.is_a? String
    assert_not_english(Faker::University.prefix)
    assert Faker::University.suffix.is_a? String
    assert_not_english(Faker::University.suffix)
    assert Faker::University.name.is_a? String
    assert_not_english(Faker::University.name)
  end
end
