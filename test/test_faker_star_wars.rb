require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerStarWars < Test::Unit::TestCase
  def setup
    @characters = Faker::StarWars.characters
    @droids = Faker::StarWars.droids
    @planets = Faker::StarWars.planets
    @quotes = Faker::StarWars.quotes
    @species = Faker::StarWars.species
    @vehicles = Faker::StarWars.vehicles
    @wookie_words = Faker::StarWars.wookie_words
  end

  def test_strings
    assert @characters.size == 33
    @characters.each do |character|
       refute character.to_s.empty?
    end

  	assert @droids.size == 21
    @droids.each do |droid|
       refute droid.to_s.empty?
    end

    assert @planets.size == 20
    @planets.each do |planet|
      refute planet.to_s.empty?
    end

  	assert @quotes.size == 30
    @quotes.each do |quote|
       refute quote.to_s.empty?
    end

  	assert @species.size == 9
    @species.each do |specie|
       refute specie.to_s.empty?
    end

    assert @vehicles.size == 21
    @vehicles.each do |vehicle|
       refute vehicle.to_s.empty?
    end

    assert @wookie_words.size == 22
    @wookie_words.each do |word|
       assert !word.nil?
       assert word != ""
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

  def test_wookie_sentence
    assert Faker::StarWars.wookie_sentence.match(/\w+/)
  end
end
