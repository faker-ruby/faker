# frozen_string_literal: true

require_relative 'test_helper'

class TestEnNzLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'ma-NZ'
  end

  def teardown
    Faker::Config.locale = nil
  end

  # def test_en_nz_address_methods
  #   assert Faker::Address.street_name.is_a? String
  #   assert Faker::Address.city.is_a? String
  #   assert Faker::Address.region.is_a? String
  #   assert Faker::Address.region_abbr.is_a? String
  #   assert Faker::Address.postcode.is_a? String
  #   assert_equal 'Aotearoa', Faker::Address.default_country
  # end

  def test_ma_nz_name_methods
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    puts "ma-NZ test ran"
  end
end
