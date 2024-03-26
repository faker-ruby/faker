# frozen_string_literal: true

require_relative 'test_helper'

class TestEsMxLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'es-MX'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_es_mx_address
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_empty Faker::Address.city_prefix
    assert_empty Faker::Address.city_suffix
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.city(options: { with_state: true })
    assert_equal(2, Faker::Address.city(options: { with_state: true }).split(', ').count)
    assert_kind_of String, Faker::Address.secondary_address
  end

  def test_es_mx_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of String, Faker::Company.prefix
    assert_kind_of String, Faker::Company.name
  end

  def test_es_mx_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_es_mx_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_es_mx_phone_number
    assert_kind_of String, Faker::PhoneNumber.phone_number
    assert_kind_of String, Faker::PhoneNumber.cell_phone
  end

  def test_es_mx_subscription_methods
    assert_kind_of String, Faker::Subscription.plan
    assert_kind_of String, Faker::Subscription.status
    assert_kind_of String, Faker::Subscription.payment_method
    assert_kind_of String, Faker::Subscription.subscription_term
    assert_kind_of String, Faker::Subscription.payment_term
  end

  def test_es_mx_university_methods
    assert_kind_of String, Faker::University.suffix
    assert_kind_of String, Faker::University.prefix
  end

  def test_es_mx_finance_vat_number
    vat = Faker::Finance.vat_number(country: 'MX')

    assert_kind_of String, vat
    assert_match(/([A-ZÑ]){3,4}(\d){6}([A-Z0-9]){3}/, vat)
  end
end
