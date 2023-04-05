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
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert_empty Faker::Address.city_prefix
    assert_empty Faker::Address.city_suffix
    assert Faker::Address.city.is_a?(String)
    assert Faker::Address.city(options: { with_state: true }).is_a?(String)
    assert_equal(2, Faker::Address.city(options: { with_state: true }).split(', ').count)
    assert Faker::Address.secondary_address.is_a? String
  end

  def test_es_mx_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.prefix.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_es_mx_internet_methods
    assert Faker::Internet.email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_es_mx_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_es_mx_phone_number
    assert Faker::PhoneNumber.phone_number.is_a? String
    assert Faker::PhoneNumber.cell_phone.is_a? String
  end

  def test_es_mx_subscription_methods
    assert Faker::Subscription.plan.is_a? String
    assert Faker::Subscription.status.is_a? String
    assert Faker::Subscription.payment_method.is_a? String
    assert Faker::Subscription.subscription_term.is_a? String
    assert Faker::Subscription.payment_term.is_a? String
  end

  def test_es_mx_university_methods
    assert Faker::University.suffix.is_a? String
    assert Faker::University.prefix.is_a? String
  end

  def test_es_mx_finance_vat_number
    vat = Faker::Finance.vat_number(country: 'MX')

    assert vat.is_a? String
    assert_match(/([A-ZÑ]){3,4}(\d){6}([A-Z0-9]){3}/, vat)
  end
end
