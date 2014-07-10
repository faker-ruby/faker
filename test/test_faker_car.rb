require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerCar < Test::Unit::TestCase

  def setup
    @tester = Faker::Car
  end

  def test_license_plate
  end

  def test_license_plate_is_string
    assert @tester.license_plate.is_a? String
  end
end
