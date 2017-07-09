require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerPokemon < Test::Unit::TestCase
  def setup
    @tester = Faker::Pokemon
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end

  def test_move
    assert @tester.move.match(/\w+/)
  end


end
