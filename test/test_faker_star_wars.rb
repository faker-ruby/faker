require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerStarWars < Test::Unit::TestCase
  def setup
    @tester = Faker::StarWars
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_droid
    assert @tester.droid.match(/\w+/)
  end

  def test_planet
    assert @tester.planet.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end

  def test_specie
    assert @tester.specie.match(/\w+/)
  end

  def test_vehicle
    assert @tester.vehicle.match(/\w+/)
  end

  def test_wookiee_sentence
    assert @tester.wookiee_sentence.match(/\w+/)
  end
end
