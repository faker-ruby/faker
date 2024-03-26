# frozen_string_literal: true

require_relative 'test_helper'

class TestMaNzLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'mi-NZ'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_mi_nz_address_methods
    assert_kind_of String, Faker::Address.street_name
    assert_kind_of String, Faker::Address.city
    assert_kind_of String, Faker::Address.region
    assert_kind_of String, Faker::Address.region_abbr
    assert_kind_of String, Faker::Address.postcode
    assert_equal 'Aotearoa', Faker::Address.default_country
  end

  def test_mi_nz_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.name_with_middle
  end
end
