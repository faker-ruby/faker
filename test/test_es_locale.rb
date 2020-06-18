# frozen_string_literal: true

require_relative 'test_helper'

LoadedEsYaml = %w[en es].each_with_object({}) do |locale, h|
  h[locale] = YAML.load_file(File.expand_path(File.dirname(__FILE__) + "/../lib/locales/#{locale}.yml"))[locale]['faker']
end

class TestEsLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'es'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_locale_separate_from_i18n
    I18n.locale = :en
    assert Faker::Address.street_name.match?(//)
  end

  def test_configured_locale_translation
    assert_equal Faker::Base.translate('faker.address.city_prefix').first, LoadedEsYaml['es']['address']['city_prefix'].first
  end

  def test_locale_override_when_calling_translate
    assert_equal Faker::Base.translate('faker.separator', locale: :en), LoadedEsYaml['en']['separator']
  end

  def test_translation_fallback
    assert_nil LoadedEsYaml['es']['company']['bs']
    assert_not_nil LoadedEsYaml['es']['address']['city_prefix']
    assert_equal Faker::Base.translate('faker.address.city_prefix'), LoadedEsYaml['es']['address']['city_prefix']
  end

  def test_es_address_methods
    assert Faker::Address.city_prefix.is_a? String
    assert Faker::Address.city_suffix.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.country.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.default_country, 'España'
  end

  def test_es_color_methods
    assert Faker::Color.color_name.is_a? String
  end

  def test_es_company_methods
    assert Faker::Company.name.is_a? String
    assert Faker::Company.suffix.is_a? String
  end

  def test_es_commerce_methods
    assert Faker::Commerce.color.is_a? String
    assert Faker::Commerce.department.is_a? String
    assert Faker::Commerce.product_name.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_es_food_methods
    assert Faker::Food.ingredient.is_a? String
    assert Faker::Food.spice.is_a? String
    assert Faker::Food.measurement.is_a? String
  end

  def test_es_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_es_name_methods
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.suffix.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.middle_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.initials.match?(/[A-Z]{3}/)
    assert Faker::Name.initials(number: 2).match?(/[A-Z]{2}/)
  end

  def test_es_vehicle_methods
    assert Faker::Vehicle.license_plate.is_a? String
  end

  def test_es_subscription_methods
    assert Faker::Subscription.plan.is_a? String
    assert Faker::Subscription.status.is_a? String
    assert Faker::Subscription.payment_method.is_a? String
    assert Faker::Subscription.subscription_term.is_a? String
    assert Faker::Subscription.payment_term.is_a? String
  end
end
