require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerAddress < Test::Unit::TestCase

  def setup
    @tester = Faker::Address
  end

  def test_city
    assert @tester.city.match(/\w+/)
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

  def test_zip_code
    assert @tester.zip_code.match(/^\d+-?\d*$/)
  end

  def test_time_zone
    assert @tester.time_zone.match(/\w+\/\w+/)
  end

  def test_mailing_address
    lines = @tester.mailing_address.split("\n")
    assert_equal(lines.length, 4)
    assert lines[0].match(/\w+/)
    assert lines[1].match(/\d+\s\w+\s\w+/)
    assert lines[2].match(/^\d+-?\d*$/)
    assert lines[3].match(/\w+/)
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

  def test_country_code
    assert @tester.country_code.match(/[A-Z]{2}/)
  end

  def test_latitude
    assert @tester.latitude.match(/-?\d+\.\d+/)
  end

  def test_longitude
    assert @tester.longitude.match(/-?\d+\.\d+/)
  end

  def test_full_address
    assert @tester.full_address.match(/\w*\.?\s?\d*\s?\d+\s\w+\s\w+,\s\w+\s?\w*,\s[A-Z]{2}\s\d+/)
  end
end
