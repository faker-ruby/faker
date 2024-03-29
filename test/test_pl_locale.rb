# frozen_string_literal: true

require_relative 'test_helper'

class TestPlLocale < Test::Unit::TestCase
  def setup
    @phone_prefixes = %w[12 13 14 15 16 17 18 22 23 24 25 29 32 33 34 41 42 43 44 46 48 52 54 55 56 58 59 61 62 63 65 67 68 71 74 75 76 77 81 82 83 84 85 86 87 89 91 94 95].sort
    @cell_prefixes = %w[50 51 53 57 60 66 69 72 73 78 79 88].sort
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = :pl
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_pl_names
    names = Faker::Base.fetch_all('name.first_name') + Faker::Base.fetch_all('name.last_name')

    names.each { |name| assert_match(/([\wĄąĆćĘęŁłÓóŚśŻżŹź]+\.? ?){2,3}/, name) }
  end

  def test_pl_phone_number
    prefixes = (0..999).map { Faker::PhoneNumber.phone_number[0, 2] }.uniq.sort

    assert_equal @phone_prefixes, prefixes
  end

  def test_pl_cell_phone
    prefixes = (0..999).map { Faker::PhoneNumber.cell_phone[0, 2] }.uniq.sort

    assert_equal @cell_prefixes, prefixes
  end

  def test_pl_address_methods
    assert_kind_of String, Faker::Address.country
    assert_kind_of String, Faker::Address.state
    assert_kind_of String, Faker::Address.state_abbr
    assert_kind_of String, Faker::Address.city_name
    assert_kind_of String, Faker::Address.country_code
    assert_kind_of String, Faker::Address.building_number
    assert_kind_of String, Faker::Address.street_prefix
    assert_kind_of String, Faker::Address.secondary_address
    assert_kind_of String, Faker::Address.postcode
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.street_address
    assert_kind_of String, Faker::Address.default_country
    assert_equal('Polska', Faker::Address.default_country)
  end

  def test_pl_coin_methods
    assert_kind_of String, Faker::Coin.flip
  end

  def test_pl_company_methods
    assert_kind_of String, Faker::Company.suffix
    assert_kind_of Array, Faker::Company.buzzwords
    assert_kind_of String, Faker::Company.bs
    assert_kind_of String, Faker::Company.name
  end

  def test_pl_internet_methods
    assert_kind_of String, Faker::Internet.email
    assert_kind_of String, Faker::Internet.domain_suffix
  end

  def test_pl_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.name_with_middle
  end
end
