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
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
  end

  def test_ee_company_methods
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.buzzwords.is_a? Array
    assert Faker::Company.bs.is_a? String
    assert Faker::Company.name.is_a? String
  end

  def test_ee_internet_methods
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_ee_invoice_methods
    assert Faker::Invoice.creditor_reference.is_a? String
    assert Faker::Invoice.reference.is_a? String
    assert Faker::Invoice.reference('4106453482608858924').is_a? String
  end

  def test_ee_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
  end

  def test_ee_phone_number
    100.times do
      phone_number_prefix = Faker::PhoneNumber.phone_number[0..1]
      assert_include @valid_phone_prefixes, phone_number_prefix
    end
  end

  def test_ee_cell_phone
    100.times do
      cell_phone_prefix = Faker::PhoneNumber.cell_phone[0]
      assert_include @valid_cell_phone_prefixes, cell_phone_prefix
    end
  end
end
