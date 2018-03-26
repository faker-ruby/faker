require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerElderScrolls < Test::Unit::TestCase

  def setup
    @tester = Faker::ElderScrolls
  end

  def test_race
    assert @tester.race.match(/\w+/)
  end

  def test_region
    assert @tester.region.match(/\w+/)
  end

  def test_city
    assert @tester.city.match(/\w+/)
  end

  def test_dragon
    assert @tester.dragon.match(/\w+/)
  end

  def test_creature
    assert @tester.creature.match(/\w+/)
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

end
