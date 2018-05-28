require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerVentureBros < Test::Unit::TestCase
  def setup
    @tester = Faker::VentureBros
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_vehicle
    assert @tester.vehicle.match(/\w+/)
  end

  def test_organization
    assert @tester.organization.match(/\w+/)
  end

  def test_quote
    assert @tester.quote.match(/\w+/)
  end
end
