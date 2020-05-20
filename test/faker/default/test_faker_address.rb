# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAddress < Test::Unit::TestCase
  def setup
    @tester = Faker::Address
  end

  def test_city
    assert @tester.city.match(/\w+/)
  end

  def test_city_with_state
    assert @tester.city(options: { with_state: true }).match(/\w+,\s\w+/)
  end

  def test_street_name
    assert @tester.street_name.match(/\w+\s\w+/)
  end

  def test_street_address
    assert @tester.street_address.match(/\d+\s\w+\s\w+/)
  end

  def test_secondary_address
    assert @tester.secondary_address.match(/\w+\.?\s\d+/)
  end

  def test_building_number
    assert @tester.building_number.match(/\d+/)
  end

  def test_mail_box
    assert @tester.mail_box.match(/[\w ]+\d+/)
  end

  def test_zip_code
    assert @tester.zip_code.match(/^\d+-?\d*$/)
  end

  def test_time_zone
    assert @tester.time_zone.match(%r{\w+\/\w+})
  end

  def test_street_suffix
    assert @tester.street_suffix.match(/\w+/)
  end

  def test_city_suffix
    assert @tester.city_suffix.match(/\w+/)
  end

  def test_city_prefix
    assert @tester.city_prefix.match(/\w+/)
  end

  def test_state_abbr
    assert @tester.state_abbr.match(/[A-Z]{2}/)
  end

  def test_state
    assert @tester.state.match(/\w+/)
  end

  def test_country
    assert @tester.country.match(/\w+/)
  end

  def test_country_by_code
    assert @tester.country_by_code(code: 'NL').match('Netherlands')
  end

  def test_country_name_to_code
    assert @tester.country_name_to_code(name: 'united_states').match('US')
  end

  def test_country_code
    assert @tester.country_code.match(/[A-Z]{2}/)
  end

  def test_latitude
    assert_instance_of Float, @tester.latitude
  end

  def test_longitude
    assert_instance_of Float, @tester.longitude
  end

  def test_full_address
    assert @tester.full_address.match(/\w*\.?\s?\d*\s?\d+\s\w+\s\w+,\s\w+\s?\w*,\s[A-Z]{2}\s\d+/)
  end
end
