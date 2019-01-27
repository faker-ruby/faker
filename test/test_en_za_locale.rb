# frozen_string_literal: true

require_relative 'test_helper'

class TestEnZaLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-ZA'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_za_address_methods
    assert Faker::Address.country_code.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Address.post_code.is_a? String
    assert Faker::Address.province.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city.is_a? String
  end

  def test_en_za_company_methods
    assert Faker::Company.name.is_a? String
    assert Faker::Company.type.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.company_names.is_a? String
  end

  def test_en_za_internet_methods
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_en_za_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end
end
