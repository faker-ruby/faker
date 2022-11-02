# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAirport < Test::Unit::TestCase
  def setup
    @tester = Faker::Travel::Airport
  end

  def test_united_states
    assert_match(/\w+/, @tester.united_states)
  end

  def test_us_large
    assert_match(/\w+/, @tester.us_large)
  end

  def test_us_medium
    assert_match(/\w+/, @tester.us_medium)
  end

  def test_us_small
    assert_match(/\w+/, @tester.us_small)
  end

  def test_us_iata
    assert_match(/\w+/, @tester.us_iata)
  end

  def test_us_iata_large
    assert_match(/\w+/, @tester.us_iata_large)
  end

  def test_us_iata_medium
    assert_match(/\w+/, @tester.us_iata_medium)
  end

  def test_us_iata_small
    assert_match(/\w+/, @tester.us_iata_small)
  end

  def test_european_union
    assert_match(/\w+/, @tester.european_union)
  end

  def test_eu_large
    assert_match(/\w+/, @tester.eu_large)
  end

  def test_eu_medium
    assert_match(/\w+/, @tester.eu_large)
  end

  def test_eu_iata
    assert_match(/\w+/, @tester.eu_iata)
  end

  def test_eu_iata_large
    assert_match(/\w+/, @tester.eu_iata_large)
  end

  def test_eu_iata_medium
    assert_match(/\w+/, @tester.eu_iata_medium)
  end
end
