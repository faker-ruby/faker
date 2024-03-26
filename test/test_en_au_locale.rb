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
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.default_country
  end

  def test_en_au_company_methods
    assert_kind_of String, Faker::Company.suffix
  end

  def test_en_au_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_aussie_mobiles_start_with_04
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')

    assert_equal '0', mobile[0]
    assert_equal '4', mobile[1]
  end
end
