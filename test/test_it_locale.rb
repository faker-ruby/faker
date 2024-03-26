# frozen_string_literal: true

require_relative 'test_helper'

class TestItLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'it'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_it_address_methods
    assert_kind_of String, Faker::Address.city_prefix
    assert_kind_of String, Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.building_number
    assert_equal('Italia', Faker::Address.default_country)
  end

  def test_it_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of Array, Faker::Company.buzzwords
    assert_kind_of String, Faker::Company.bs
    assert_kind_of String, Faker::Company.name
  end

  def test_it_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_it_name_methods
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
    assert_equal('.', Faker::Name.prefix[-1, 1])
  end

  def test_it_phone_number_methods
    assert_kind_of String, Faker::PhoneNumber.phone_number
  end

  def test_it_subscription_methods
    assert_kind_of String, Faker::Subscription.plan
    assert_kind_of String, Faker::Subscription.status
    assert_kind_of String, Faker::Subscription.payment_method
    assert_kind_of String, Faker::Subscription.subscription_term
    assert_kind_of String, Faker::Subscription.payment_term
  end
end
