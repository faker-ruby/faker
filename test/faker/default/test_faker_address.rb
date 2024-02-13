# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAddress < Test::Unit::TestCase
  def setup
    @tester = Faker::Address
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end

  def test_city_with_state
    assert_match(/\w+,\s\w+/, @tester.city(options: { with_state: true }))
  end

  def test_street_name
    assert_match(/\w+\s\w+/, @tester.street_name)
  end

  def test_street_address
    assert_match(/\d+\s\w+\s\w+/, @tester.street_address)
  end

  def test_secondary_address
    assert_match(/\w+\.?\s\d+/, @tester.secondary_address)
  end

  def test_building_number
    assert_match(/\d+/, @tester.building_number)
  end

  def test_mail_box
    assert_match(/[\w ]+\d+/, @tester.mail_box)
  end

  def test_zip_code
    assert_match(/^\d+-?\d*$/, @tester.zip_code)
  end

  def test_time_zone
    assert_match %r{\w+/\w+}, @tester.time_zone
  end

  def test_street_suffix
    assert_match(/\w+/, @tester.street_suffix)
  end

  def test_city_suffix
    assert_match(/\w+/, @tester.city_suffix)
  end

  def test_city_prefix
    assert_match(/\w+/, @tester.city_prefix)
  end

  def test_state_abbr
    assert_match(/[A-Z]{2}/, @tester.state_abbr)
  end

  def test_state
    assert_match(/\w+/, @tester.state)
  end

  def test_country
    assert_match(/\w+/, @tester.country)
  end

  def test_country_by_code
    assert_match @tester.country_by_code(code: 'NL'), 'Netherlands'
  end

  def test_country_name_to_code
    assert_match @tester.country_name_to_code(name: 'united_states'), 'US'
  end

  def test_country_code
    assert_match(/[A-Z]{2}/, @tester.country_code)
  end

  def test_latitude
    assert_instance_of Float, @tester.latitude
  end

  def test_longitude
    assert_instance_of Float, @tester.longitude
  end

  def test_full_address
    assert_match(/\w*\.?\s?\d*\s?\d+\s\w+\s\w+,\s\w+\s?\w*,\s[A-Z]{2}\s\d+/, @tester.full_address)
  end

  def test_full_address_as_hash
    assert_instance_of Hash, @tester.full_address_as_hash
  end

  def test_full_address_as_hash_by_longitude
    assert_instance_of Float, @tester.full_address_as_hash(:longitude)[:longitude]
  end
end
