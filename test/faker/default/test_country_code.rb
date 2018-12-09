# frozen_string_literal: true

require_relative '../../test_helper'

class TestCountryCode < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_country_code_expected_length
    assert_equal(2, Faker::Address.country_code.length)
  end

  def test_country_code_long_expected_length
    assert_equal(3, Faker::Address.country_code_long.length)
  end
end
