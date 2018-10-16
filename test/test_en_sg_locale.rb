# frozen_string_literal: true

require_relative 'test_helper'

class TestEnSgLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-SG'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_sg_address_methods
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.streets.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert_equal('Singapore', Faker::Address.default_country)
  end

  def test_en_sg_name_methods
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.male_english_name.is_a? String
    assert Faker::Name.female_english_name.is_a? String
    assert Faker::Name.name_with_middle.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.name.is_a? String
  end
end
