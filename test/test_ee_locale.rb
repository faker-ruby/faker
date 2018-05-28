# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEeLocale < Test::Unit::TestCase
  def setup
    @phone_prefixes = %w[32 33 35 38 39 43 44 45 46 47 48 61 62 63 64 65 66
                         67 68 69 71 72 73 74 75 76 77 78 79 88].sort
    @cell_prefixes  = %w[5 8].sort
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = :ee
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_ee_phone_number
    prefixes = (0..999).map { Faker::PhoneNumber.phone_number[0, 2] }.uniq.sort
    assert_equal @phone_prefixes, prefixes
  end

  def test_ee_cell_phone
    prefixes = (0..999).map { Faker::PhoneNumber.cell_phone[0] }.uniq.sort
    assert_equal @cell_prefixes, prefixes
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

  def test_ee_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.prefix.is_a? String
    assert Faker::Name.title.is_a? String
  end
end
