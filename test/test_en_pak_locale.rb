# frozen_string_literal: true

require_relative 'test_helper'

class TestEnPakLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-PAK'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_pak_methods
    assert Faker::Address.state.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert_match(/\A(Pakistan|Islamic Republic of Pakistan)\z/, Faker::Address.default_country)
  end

  def test_en_pak_company_methods
    assert Faker::Company.suffix.is_a? String
  end

  def test_en_pak_internet_methods
    assert Faker::Internet.email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_en_pak_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end
end
