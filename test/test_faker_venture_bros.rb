require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerVentureBros < Test::Unit::TestCase

  def setup
    @tester = Faker::VentureBros
  end

  def test_characters
    assert @tester.character.match(/\w+/)
  end

  def test_vehicles
    assert @tester.vehicle.match(/\w+/)
  end

  def test_organizations
    assert @tester.organization.match(/\w+/)
  end

  def test_quotes
    assert @tester.quote.match(/\w+/)
  end
end
