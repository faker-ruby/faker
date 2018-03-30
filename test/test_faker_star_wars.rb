require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerStarWars < Test::Unit::TestCase
  def setup
    @characters = Faker::StarWars.characters
    @droids = Faker::StarWars.droids
    @planets = Faker::StarWars.planets
    @quotes = Faker::StarWars.quotes
    @species = Faker::StarWars.species
    @vehicles = Faker::StarWars.vehicles
  end

  def test_strings
    assert @characters.size == 33
    @characters.each do |character|
       assert !character.nil?
       assert character != ""
    end

  	assert @droids.size == 21
    @droids.each do |droid|
       assert !droid.nil?
       assert droid != ""
    end

    assert @planets.size == 20
    @planets.each do |planet|
      assert !planet.nil?
      assert planet != ""
    end

  	assert @quotes.size == 30
    @quotes.each do |quote|
       assert !quote.nil?
       assert quote != ""
    end

  	assert @species.size == 9
    @species.each do |specie|
       assert !specie.nil?
       assert specie != ""
    end

    assert @vehicles.size == 21
    @vehicles.each do |vehicle|
       assert !vehicle.nil?
       assert vehicle != ""
    end
  end

  def test_character
    assert Faker::StarWars.character.match(/\w+/)
  end

  def test_droid
    assert Faker::StarWars.droid.match(/\w+/)
  end

  def test_planet
    assert Faker::StarWars.planet.match(/\w+/)
  end

  def test_quote
    assert Faker::StarWars.quote.match(/\w+/)
  end

  def test_specie
    assert Faker::StarWars.specie.match(/\w+/)
  end

  def test_vehicle
    assert Faker::StarWars.vehicle.match(/\w+/)
  end
end
