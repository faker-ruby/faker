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

  def test_en_sg_methods
    assert Faker::Name.male_first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.female_first_name.is_a? String
    assert Faker::Name.male_english_name.is_a? String
    assert Faker::Name.female_english_name.is_a? String
    assert Faker::Address.streets.is_a? String
  end

  def test_en_sg_default_country
    assert_equal('Singapore', Faker::Address.default_country)
  end
end
