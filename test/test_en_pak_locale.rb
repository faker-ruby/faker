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
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.default_country
    assert_kind_of String, Faker::Address.postcode
    assert_match(/\A(Pakistan|Islamic Republic of Pakistan)\z/, Faker::Address.default_country)
  end

  def test_en_pak_company_methods
    assert_kind_of String, Faker::Company.suffix
  end

  def test_en_pak_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_en_pak_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
  end
end
