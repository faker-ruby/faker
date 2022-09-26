# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSpace < Test::Unit::TestCase
  def setup
    @tester = Faker::Space
  end

  def test_planet
    assert_match(/(\w+\.? ?){2,3}/, @tester.planet)
  end

  def test_moon
    assert_match(/(\w+\.? ?){2,3}/, @tester.moon)
  end

  def test_galaxy
    assert_match(/(\w+\.? ?){2,3}/, @tester.galaxy)
  end

  def test_nebula
    assert_match(/(\w+\.? ?){2,3}/, @tester.nebula)
  end

  def test_star_cluster
    assert_match(/(\w+\.? ?){2,3}/, @tester.star_cluster)
  end

  def test_constellation
    assert_match(/(\w+\.? ?){2,3}/, @tester.constellation)
  end

  def test_star
    assert_match(/(\w+\.? ?){2,3}/, @tester.star)
  end

  def test_agency
    assert_match(/(\w+\.? ?){2,3}/, @tester.agency)
  end

  def test_agency_abv
    assert_match(/(\w+\.? ?){2,3}/, @tester.agency_abv)
  end

  def test_nasa_space_craft
    assert_match(/(\w+\.? ?){2,3}/, @tester.nasa_space_craft)
  end

  def test_company
    assert_match(/(\w+\.? ?){2,3}/, @tester.company)
  end

  def test_distance_measurement
    assert_match(/(\w+\.? ?){2,3}/, @tester.distance_measurement)
  end

  def test_meteorite
    assert_match(/(\w+\.? ?){2,3}/, @tester.meteorite)
  end

  def test_launch_vehicle
    assert_match(/(\w+\.? ?){2,3}/, @tester.launch_vehicle)
  end
end
