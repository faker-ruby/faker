require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestFakerStarTrek < Test::Unit::TestCase
  def setup
    @tester = Faker::StarTrek
  end

  def test_champions
    assert @tester.characters.match(/\w+/)
  end

  def test_locations
    assert @tester.locations.match(/\w+/)
  end

  def test_species
    assert @tester.species.match(/\w+/)
  end

  def test_villains
    assert @tester.villains.match(/\w+/)
  end
end