# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSpace < Test::Unit::TestCase
  def setup
    @tester = Faker::Space
  end

  def test_planet
    assert_match @tester.planet, /(\w+\.? ?){2,3}/
  end

  def test_moon
    assert_match @tester.moon, /(\w+\.? ?){2,3}/
  end

  def test_galaxy
    assert_match @tester.galaxy, /(\w+\.? ?){2,3}/
  end

  def test_nebula
    assert_match @tester.nebula, /(\w+\.? ?){2,3}/
  end

  def test_star_cluster
    assert_match @tester.star_cluster, /(\w+\.? ?){2,3}/
  end

  def test_constellation
    assert_match @tester.constellation, /(\w+\.? ?){2,3}/
  end

  def test_star
    assert_match @tester.star, /(\w+\.? ?){2,3}/
  end

  def test_agency
    assert_match @tester.agency, /(\w+\.? ?){2,3}/
  end

  def test_agency_abv
    assert_match @tester.agency_abv, /(\w+\.? ?){2,3}/
  end

  def test_nasa_space_craft
    assert_match @tester.nasa_space_craft, /(\w+\.? ?){2,3}/
  end

  def test_company
    assert_match @tester.company, /(\w+\.? ?){2,3}/
  end

  def test_distance_measurement
    assert_match @tester.distance_measurement, /(\w+\.? ?){2,3}/
  end

  def test_meteorite
    assert_match @tester.meteorite, /(\w+\.? ?){2,3}/
  end

  def test_launch_vehicle
    assert_match @tester.launch_vehicle, /(\w+\.? ?){2,3}/
  end
end
