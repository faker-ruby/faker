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
    assert_kind_of String, Faker::Address.postcode
    # Added Actual Japanese Zipcodes in lib/locals/ja.yml
    assert_match(/\A\d{3}-\d{4}\z/, Faker::Address.postcode)
    assert_not_english(Faker::Address.postcode)
    assert_kind_of String, Faker::Address.state
    assert_not_english(Faker::Address.state)
    assert_kind_of String, Faker::Address.state_abbr
    assert_not_english(Faker::Address.state_abbr)
    assert_kind_of String, Faker::Address.city_prefix
    assert_not_english(Faker::Address.city_prefix)
    assert_kind_of String, Faker::Address.city_suffix
    assert_not_english(Faker::Address.city_suffix)
    assert_kind_of String, Faker::Address.city
    assert_not_english(Faker::Address.city)
    assert_kind_of String, Faker::Address.street_name
    assert_not_english(Faker::Address.street_name)
  end

  def test_ja_adjective_methods
    assert_kind_of String, Faker::Adjective.positive
    assert_not_english(Faker::Adjective.positive)
    assert_kind_of String, Faker::Adjective.negative
    assert_not_english(Faker::Adjective.negative)
  end

  def test_ja_ancient_methods
    assert_kind_of String, Faker::Ancient.god
    assert_not_english(Faker::Ancient.god)
  end

  def test_ja_cat_methods
    assert_kind_of String, Faker::Creature::Cat.breed
    assert_not_match(/[a-zA-Z]/, Faker::Creature::Cat.breed)
  end

  def test_ja_color_methods
    assert_kind_of String, Faker::Color.color_name
    assert_not_english(Faker::Color.color_name)
  end

  def test_ja_book_methods
    assert_kind_of String, Faker::Book.title
    assert_not_english(Faker::Book.title)
    assert_kind_of String, Faker::Book.author
    assert_not_english(Faker::Book.author)
    assert_kind_of String, Faker::Book.publisher
    assert_not_english(Faker::Book.publisher)
    assert_kind_of String, Faker::Book.genre
    assert_not_english(Faker::Book.genre)
  end

  def test_ja_coffee_methods
    assert_kind_of String, Faker::Coffee.country
    assert_not_english(Faker::Coffee.country)
  end

  def test_ja_commerce_methods
    assert_kind_of String, Faker::Commerce.department
    assert_not_english(Faker::Commerce.department)
    assert_kind_of String, Faker::Commerce.product_name
    assert_not_english(Faker::Commerce.product_name)
    assert_kind_of String, Faker::Commerce.promotion_code
    assert_not_english(Faker::Commerce.promotion_code)
  end

  def test_ja_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_not_english(Faker::Company.suffix)
    assert_kind_of String, Faker::Company.category
    assert_not_english(Faker::Company.category)
    assert_kind_of String, Faker::Company.name
    assert_not_english(Faker::Company.name)
  end

  def test_ja_dog_methods
    assert_kind_of String, Faker::Creature::Dog.breed
    assert_not_match(/[a-zA-Z]/, Faker::Creature::Dog.breed)
  end

  def test_ja_emotion_methods
    assert_kind_of String, Faker::Emotion.noun
    assert_not_english(Faker::Emotion.noun)
    assert_kind_of String, Faker::Emotion.adjective
    assert_not_english(Faker::Emotion.adjective)
  end

  def test_ja_food_methods
    assert_kind_of String, Faker::Food.sushi
    assert_not_english(Faker::Food.sushi)
  end

  def test_ja_gender_methods
    assert_kind_of String, Faker::Gender.binary_type
    assert_not_english(Faker::Gender.binary_type)
  end

  def test_ja_lorem_methods
    assert_kind_of Array, Faker::Lorem.words
    assert Faker::Lorem.words(number: 1000)
    assert Faker::Lorem.words(number: 10_000, supplemental: true)
    assert_not_match(/ /, Faker::Lorem.paragraph)
  end

  def test_ja_name_methods
    assert_kind_of String, Faker::Name.last_name
    assert_not_english(Faker::Name.last_name)
    assert_kind_of String, Faker::Name.first_name
    assert_not_english(Faker::Name.first_name)
    assert_kind_of String, Faker::Name.name
    assert_not_english(Faker::Name.name)
    assert_kind_of String, Faker::Name.name_with_middle
    assert_not_english(Faker::Name.name_with_middle)
  end

  def test_ja_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.cell_phone
    assert_not_english(Faker::PhoneNumber.cell_phone)
    assert_kind_of String, Faker::PhoneNumber.phone_number
    assert_not_english(Faker::PhoneNumber.phone_number)
  end

  def test_ja_overwatch_methods
    assert_kind_of String, Faker::Games::Overwatch.hero
    hero = Faker::Games::Overwatch.hero
    assert_not_english(hero) unless hero == 'D.Va'
  end

  def test_ja_pokemon_methods
    assert_kind_of String, Faker::Games::Pokemon.name
    assert_not_english(Faker::Games::Pokemon.name)
    assert_kind_of String, Faker::Games::Pokemon.location
    assert_not_english(Faker::Games::Pokemon.location)
    assert_kind_of String, Faker::Games::Pokemon.move
    assert_not_english(Faker::Games::Pokemon.move)
  end

  def test_ja_supermario_methods
    assert_kind_of String, Faker::Games::SuperMario.character
    assert_not_english(Faker::Games::SuperMario.character)
    assert_kind_of String, Faker::Games::SuperMario.game
    assert_not_english(Faker::Games::SuperMario.game)
    assert_kind_of String, Faker::Games::SuperMario.location
    assert_not_english(Faker::Games::SuperMario.location)
  end

  def test_ja_touhou_methods
    assert_kind_of String, Faker::Games::Touhou.game
    assert_not_english(Faker::Games::Touhou.game)
    assert_kind_of String, Faker::Games::Touhou.character
    assert_not_english(Faker::Games::Touhou.character)
    assert_kind_of String, Faker::Games::Touhou.location
    assert_not_english(Faker::Games::Touhou.location)
    assert_kind_of String, Faker::Games::Touhou.spell_card
    assert_not_english(Faker::Games::Touhou.spell_card)
    assert_kind_of String, Faker::Games::Touhou.song
    assert_not_english(Faker::Games::Touhou.song)
  end

  def test_ja_zelda_methods
    assert_kind_of String, Faker::Games::Zelda.game
    assert_not_english(Faker::Games::Zelda.game)
  end

  def test_ja_restaurant_methods
    assert_kind_of String, Faker::Restaurant.name
    assert_not_english(Faker::Restaurant.name)
    assert_kind_of String, Faker::Restaurant.type
    assert_not_english(Faker::Restaurant.type)
  end

  def test_ja_space_methods
    assert_kind_of String, Faker::Space.planet
    assert_not_english(Faker::Space.planet)
    assert_kind_of String, Faker::Space.galaxy
  end

  def test_ja_studio_ghibli_methods
    assert_kind_of String, Faker::JapaneseMedia::StudioGhibli.character
    assert_not_english(Faker::JapaneseMedia::StudioGhibli.character)
    assert_kind_of String, Faker::JapaneseMedia::StudioGhibli.quote
    assert_not_english(Faker::JapaneseMedia::StudioGhibli.quote)
    assert_kind_of String, Faker::JapaneseMedia::StudioGhibli.movie
    assert_not_english(Faker::JapaneseMedia::StudioGhibli.movie)
  end

  def test_ja_naruto_methods
    assert_kind_of String, Faker::JapaneseMedia::Naruto.character
    assert_not_english(Faker::JapaneseMedia::Naruto.character)
    assert_kind_of String, Faker::JapaneseMedia::Naruto.village
    assert_not_english(Faker::JapaneseMedia::Naruto.village)
    assert_kind_of String, Faker::JapaneseMedia::Naruto.eye
    assert_not_english(Faker::JapaneseMedia::Naruto.eye)
    assert_kind_of String, Faker::JapaneseMedia::Naruto.demon
    assert_not_english(Faker::JapaneseMedia::Naruto.demon)
  end

  def test_ja_subscription_methods
    assert_kind_of String, Faker::Subscription.plan
    assert_not_english(Faker::Subscription.plan)
    assert_kind_of String, Faker::Subscription.status
    assert_not_english(Faker::Subscription.status)
    assert_kind_of String, Faker::Subscription.payment_method
    assert Array.new(10) { Faker::Subscription.payment_method }.any? { |word| !word.match?(/[a-zA-Z]/) }
    assert_kind_of String, Faker::Subscription.subscription_term
    assert_not_english(Faker::Subscription.subscription_term)
    assert_kind_of String, Faker::Subscription.payment_term
    assert_not_english(Faker::Subscription.payment_term)
  end

  def test_ja_university_methods
    assert_kind_of String, Faker::University.prefix
    assert_not_english(Faker::University.prefix)
    assert_kind_of String, Faker::University.suffix
    assert_not_english(Faker::University.suffix)
    assert_kind_of String, Faker::University.name
    assert_not_english(Faker::University.name)
  end

  def test_ja_sport_methods
    assert_kind_of String, Faker::Sport.sport
    assert_not_english(Faker::Sport.sport)
    assert_kind_of String, Faker::Sport.summer_olympics_sport
    assert_not_english(Faker::Sport.summer_olympics_sport)
    assert_kind_of String, Faker::Sport.winter_olympics_sport
    assert_not_english(Faker::Sport.winter_olympics_sport)
    assert_kind_of String, Faker::Sport.summer_paralympics_sport
    assert_not_english(Faker::Sport.summer_paralympics_sport)
    assert_kind_of String, Faker::Sport.winter_paralympics_sport
    assert_not_english(Faker::Sport.winter_paralympics_sport)
    assert_kind_of String, Faker::Sport.ancient_olympics_sport
    assert_not_english(Faker::Sport.ancient_olympics_sport)
    assert_kind_of String, Faker::Sport.unusual_sport
    assert_not_english(Faker::Sport.unusual_sport)
  end

  def test_ja_football_methods
    # The translation of "team" includes alphabets, so we cannot use assert_not_english for assertion.
    # Example: "FCバルセロナ" (FC Barcelona)
    assert_kind_of String, Faker::Sports::Football.team

    assert_kind_of String, Faker::Sports::Football.player
    assert_not_english(Faker::Sports::Football.player)

    assert_kind_of String, Faker::Sports::Football.coach
    assert_not_english(Faker::Sports::Football.coach)

    # The translation of "competition" includes alphabets, so we cannot use assert_not_english for assertion.
    # Example: "UEFAチャンピオンズリーグ" (UEFA Champions League)
    assert_kind_of String, Faker::Sports::Football.competition

    assert_kind_of String, Faker::Sports::Football.position
    assert_not_english(Faker::Sports::Football.position)
  end
end
