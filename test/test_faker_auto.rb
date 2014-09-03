require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerAuto < Test::Unit::TestCase
  def setup
    @tester = Faker::Auto
  end

  def test_vin
  assert @tester.vin.match(/^[A-Z0-9]{3}[A-Z0-9]{5}[A-Z0-9]{1}[A-Z0-9]{1}[A-Z0-0]{1}[A-Z0-9]{1}\d{5}$/)
  end

  def test_mileage
    mileage = @tester.mileage
    assert mileage >= 10_000
    assert mileage < 90_000
  end

  def test_year
    year = @tester.year
    assert year >= 1981
    assert year < ::Time.now.year
  end

  def test_door_count
    assert @tester.door_count.match(/\d Door/)
  end

  def test_engine_size
    assert @tester.engine_size.match(/\d Cylinder Engine/)
  end

  def test_car_options
    car_options = @tester.car_options
    assert car_options.length >= 5
    assert car_options.length < 10
  end

  def test_standard_specs
    standard_specs = @tester.standard_specs
    assert standard_specs.length >= 5
    assert standard_specs.length < 10
  end
end