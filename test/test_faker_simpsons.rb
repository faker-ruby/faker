require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSimpsons < Test::Unit::TestCase
  def setup
    @characters = Faker::Simpsons.characters
    @locations = Faker::Simpsons.locations
  end

  def test_strings
    assert @characters.size == 33
    @characters.each do |character|
       assert !character.nil?
       assert character != ""
    end
    assert @locations.size == 20
    @locations.each do |location|
       assert !location.nil?
       assert location != ""
    end
  end

  def test_character
    assert Faker::Simpsons.character.match(/\w+/)
  end
end
