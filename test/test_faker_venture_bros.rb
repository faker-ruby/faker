require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerVentureBros < Test::Unit::TestCase

  def setup
    @tester = Faker::VentureBros
  end

  def test_characters
    assert @tester.characters.match(/\w+/)
  end

  def test_vehicles
    assert @tester.vehicles.match(/\w+/)
  end

  def test_organizations
    assert @tester.organizations.match(/\w+/)
  end

  def test_quotes
    assert @tester.quotes.match(/\w+/)
  end
end
