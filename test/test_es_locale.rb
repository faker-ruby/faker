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

    assert_match(//, Faker::Address.street_name)
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
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city
    assert Faker::Address.default_country, 'España'
  end

  def test_es_color_methods
    assert_kind_of String, Faker::Color.color_name
  end

  def test_es_company_methods
    assert_kind_of String, Faker::Company.name
    assert_kind_of String, Faker::Company.suffix
  end

  def test_es_commerce_methods
    assert_kind_of String, Faker::Commerce.color
    assert_kind_of String, Faker::Commerce.department
    assert_kind_of String, Faker::Commerce.product_name
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.name
  end

  def test_es_food_methods
    assert_kind_of String, Faker::Food.ingredient
    assert_kind_of String, Faker::Food.spice
    assert_kind_of String, Faker::Food.measurement
  end

  def test_es_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_es_name_methods
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.suffix
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.middle_name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_kind_of String, Faker::Name.male_first_name
    assert_kind_of String, Faker::Name.female_first_name
    assert_kind_of String, Faker::Name.name
    assert_match(/[A-Z]{3}/, Faker::Name.initials)
    assert_match(/[A-Z]{2}/, Faker::Name.initials(number: 2))
  end

  def test_es_vehicle_methods
    assert_kind_of String, Faker::Vehicle.license_plate
    assert_match(/\d{4}[A-Z]{3}/, Faker::Vehicle.license_plate)
    assert_match(/GR\d{4}[A-Z]{1,2}/, Faker::Vehicle.license_plate(state_abbreviation: 'GR'))
  end

  def test_es_subscription_methods
    assert_kind_of String, Faker::Subscription.plan
    assert_kind_of String, Faker::Subscription.status
    assert_kind_of String, Faker::Subscription.payment_method
    assert_kind_of String, Faker::Subscription.subscription_term
    assert_kind_of String, Faker::Subscription.payment_term
  end
end
