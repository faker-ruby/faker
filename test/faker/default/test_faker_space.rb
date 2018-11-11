# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSpace < Test::Unit::TestCase
  def setup
    @tester = Faker::Space
  end

  def test_planet
    assert @tester.planet.match(/(\w+\.? ?){2,3}/)
  end

  def test_moon
    assert @tester.moon.match(/(\w+\.? ?){2,3}/)
  end

  def test_galaxy
    assert @tester.galaxy.match(/(\w+\.? ?){2,3}/)
  end

  def test_nebula
    assert @tester.nebula.match(/(\w+\.? ?){2,3}/)
  end

  def test_star_cluster
    assert @tester.star_cluster.match(/(\w+\.? ?){2,3}/)
  end

  def test_constellation
    assert @tester.constellation.match(/(\w+\.? ?){2,3}/)
  end

  def test_star
    assert @tester.star.match(/(\w+\.? ?){2,3}/)
  end

  def test_agency
    assert @tester.agency.match(/(\w+\.? ?){2,3}/)
  end

  def test_agency_abv
    assert @tester.agency_abv.match(/(\w+\.? ?){2,3}/)
  end

  def test_nasa_space_craft
    assert @tester.nasa_space_craft.match(/(\w+\.? ?){2,3}/)
  end

  def test_company
    assert @tester.company.match(/(\w+\.? ?){2,3}/)
  end

  def test_distance_measurement
    assert @tester.distance_measurement.match(/(\w+\.? ?){2,3}/)
  end

  def test_meteorite
    assert @tester.meteorite.match(/(\w+\.? ?){2,3}/)
  end

  def test_launch_vehicule
    assert @tester.launch_vehicule.match(/(\w+\.? ?){2,3}/)
  end
end
