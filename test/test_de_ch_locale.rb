# frozen_string_literal: true

require_relative 'test_helper'

class TestDeChLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'de-CH'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_de_ch_address_methods
    assert Faker::Address.country_code.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert_equal('Schweiz', Faker::Address.default_country)
  end

  def test_de_ch_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_de_ch_internet_methods
    assert Faker::Internet.domain_suffix.is_a? String
  end
end
