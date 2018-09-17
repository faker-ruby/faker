# frozen_string_literal: true

require_relative 'test_helper'

class TestEnZaLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-ZA'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_za_internet_domain_suffix
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_en_za_address
    assert Faker::Address.country_code.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Address.post_code.is_a? String
    assert Faker::Address.province.is_a? String
    assert Faker::Address.state.is_a? String
  end

  def test_en_za_company
    assert Faker::Company.name.is_a? String
    assert Faker::Company.type.is_a? String
    assert Faker::Company.suffix.is_a? String
  end

  def test_en_za_name
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
  end
end
