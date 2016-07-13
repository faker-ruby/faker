require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerGameOfThrones < Test::Unit::TestCase
  def setup
    @characters = Faker::GameOfThrones.characters
    @houses     = Faker::GameOfThrones.houses
    @cities     = Faker::GameOfThrones.cities
  end

  def test_strings
    assert @characters.size == 37
    @characters.each do |character|
       assert !character.nil?
       assert character != ""
    end

    assert @houses.size == 11
    @houses.each do |house|
       assert !house.nil?
       assert house != ""
    end

    assert @cities.size == 36
    @cities.each do |city|
      assert !city.nil?
      assert city != ""
    end
  end

  def test_character
    assert Faker::GameOfThrones.character.match(/\w+/)
  end

  def test_house
    assert Faker::GameOfThrones.house.match(/\w+/)
  end

  def test_city
    assert Faker::GameOfThrones.city.match(/\w+/)
  end
end
