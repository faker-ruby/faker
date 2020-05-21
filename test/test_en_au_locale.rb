# frozen_string_literal: true

require_relative 'test_helper'

class TestEnAuLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'en-AU'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_en_au_address_methods
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.state_abbr.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.default_country.is_a? String
  end

  def test_en_au_company_methods
    assert Faker::Company.suffix.is_a? String
  end

  def test_en_au_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_aussie_mobiles_start_with_04
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')
    assert_equal '0', mobile[0]
    assert_equal '4', mobile[1]
  end
end
