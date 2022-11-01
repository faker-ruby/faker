# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAirport < Test::Unit::TestCase
  def setup
    @tester = Faker::Travel::Airport
  end


  def test_large_airport_us
    assert_match(/\w+/, @tester.large_airport_us)
  end

  def test_large_airport_eu
    assert_match(/\w+/, @tester.large_airport_eu)
  end

  def test_medium_airport_us
    assert_match(/\w+/, @tester.medium_airport_us)
  end

  def test_medium_airport_eu
    assert_match(/\w+/, @tester.medium_airport_eu)
  end

  def test_small_airport_us
    assert_match(/\w+/, @tester.small_airport_us)
  end

  def test_large_iata_us
    assert_match(/\w+/, @tester.iata_large_us)
  end

  def test_large_iata_eu
    assert_match(/\w+/, @tester.iata_large_eu)
  end

  def test_medium_iata_us
    assert_match(/\w+/, @tester.iata_medium_us)
  end

  def test_medium_iata_eu
    assert_match(/\w+/, @tester.iata_medium_eu)
  end

  def test_small_iata_us
    assert_match(/\w+/, @tester.iata_small_us)
  end
end
