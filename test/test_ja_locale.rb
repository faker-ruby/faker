# frozen_string_literal: true

require_relative 'test_helper'

class TestJaLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ja'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_ja_methods
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Lorem.words.is_a? Array
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::University.prefix.is_a? String
    assert Faker::University.suffix.is_a? String
    assert Faker::University.name.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Pokemon.name.is_a? String
    assert Faker::Pokemon.location.is_a? String
    assert Faker::Food.dish.is_a? String
    assert Faker::Food.description.is_a? String
    assert Faker::Food.ingredient.is_a? String
    assert Faker::Food.fruits.is_a? String
    assert Faker::Food.vegetables.is_a? String
    assert Faker::Food.measurement.is_a? String
    assert Faker::Food.metric_measurement.is_a? String
    assert Faker::Food.sushi.is_a? String
  end
end
