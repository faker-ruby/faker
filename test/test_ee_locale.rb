# frozen_string_literal: true

require_relative 'test_helper'

class TestEeLocale < Test::Unit::TestCase
  def setup
    @valid_phone_prefixes = %w[32 33 35 38 39 43 44 45 46 47 48 61 62 63 64 65
                               66 67 68 69 71 72 73 74 75 76 77 78 79 88].sort
    @valid_cell_phone_prefixes = %w[5 8].sort
    @previous_locale = Faker::Config.locale

    Faker::Config.locale = :ee
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_ee_address_methods
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_suffix
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
  end

  def test_ee_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of Array, Faker::Company.buzzwords
    assert_kind_of String, Faker::Company.bs
    assert_kind_of String, Faker::Company.name
  end

  def test_ee_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_ee_invoice_methods
    assert_kind_of String, Faker::Invoice.creditor_reference
    assert_kind_of String, Faker::Invoice.reference
    assert_kind_of String, Faker::Invoice.reference(ref: '4106453482608858924')
  end

  def test_ee_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.name_with_middle
  end

  def test_ee_phone_number
    deterministically_verify -> { Faker::PhoneNumber.phone_number[0..1] }, depth: 5 do |phone_number_prefix|
      assert_include @valid_phone_prefixes, phone_number_prefix
    end
  end

  def test_ee_cell_phone
    deterministically_verify -> { Faker::PhoneNumber.cell_phone[0] }, depth: 5 do |cell_phone_prefix|
      assert_include @valid_cell_phone_prefixes, cell_phone_prefix
    end
  end
end
