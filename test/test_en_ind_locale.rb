# frozen_string_literal: true

require_relative 'test_helper'

class TestEnIndLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-IND'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_ind_address_methods
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.default_country
    assert_match(/\d{6}$/, Faker::Address.postcode)
    assert_match(/(\w+\.? ?){2,3}/, Faker::Address.city)
  end

  def test_en_ind_company_methods
    assert_kind_of String, Faker::Company.suffix
  end

  def test_en_ind_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_en_ind_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
  end
end
