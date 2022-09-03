# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAddress < Test::Unit::TestCase
  def setup
    @tester = Faker::Address
  end

  def test_city
    assert_match @tester.city, /\w+/
  end

  def test_city_with_state
    assert_match @tester.city(options: { with_state: true }), /\w+,\s\w+/
  end

  def test_street_name
    assert_match @tester.street_name, /\w+\s\w+/
  end

  def test_street_address
    assert_match @tester.street_address, /\d+\s\w+\s\w+/
  end

  def test_secondary_address
    assert_match @tester.secondary_address, /\w+\.?\s\d+/
  end

  def test_building_number
    assert_match @tester.building_number, /\d+/
  end

  def test_mail_box
    assert_match @tester.mail_box, /[\w ]+\d+/
  end

  def test_zip_code
    assert_match @tester.zip_code, /^\d+-?\d*$/
  end

  def test_time_zone
    assert_match @tester.time_zone, %r{\w+/\w+}
  end

  def test_street_suffix
    assert_match @tester.street_suffix, /\w+/
  end

  def test_city_suffix
    assert_match @tester.city_suffix, /\w+/
  end

  def test_city_prefix
    assert_match @tester.city_prefix, /\w+/
  end

  def test_state_abbr
    assert_match @tester.state_abbr, /[A-Z]{2}/
  end

  def test_state
    assert_match @tester.state, /\w+/
  end

  def test_country
    assert_match @tester.country, /\w+/
  end

  def test_country_by_code
    assert_match @tester.country_by_code(code: 'NL'), 'Netherlands'
  end

  def test_country_name_to_code
    assert_match @tester.country_name_to_code(name: 'united_states'), 'US'
  end

  def test_country_code
    assert_match @tester.country_code, /[A-Z]{2}/
  end

  def test_latitude
    assert_instance_of Float, @tester.latitude
  end

  def test_longitude
    assert_instance_of Float, @tester.longitude
  end

  def test_full_address
    assert_match @tester.full_address, /\w*\.?\s?\d*\s?\d+\s\w+\s\w+,\s\w+\s?\w*,\s[A-Z]{2}\s\d+/
  end

  def test_full_address_as_hash
    assert_instance_of Hash, @tester.full_address_as_hash
  end

  def test_full_address_as_hash_by_longitude
    assert_instance_of Float, @tester.full_address_as_hash(:longitude)[:longitude]
  end
end
