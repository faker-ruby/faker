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
    assert Faker::Address.state.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert_match(/[\d]{6}$/, Faker::Address.postcode)
    assert_match(/(\w+\.? ?){2,3}/, Faker::Address.city)
  end

  def test_en_ind_company_methods
    assert Faker::Company.suffix.is_a? String
  end

  def test_en_ind_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_en_ind_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end
end
