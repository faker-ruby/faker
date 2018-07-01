require_relative 'test_helper'

class TestFakerVehicle < Test::Unit::TestCase
  def setup
    @tester = Faker::Vehicle
    @vin_chars = '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ'
    @vin_map = '0123456789X'
    @vin_weights = '8765432X098765432'
  end

  def test_vin
    vin = @tester.vin
    checksum = vin_checksum(vin)

    assert vin.length == 17
    assert vin[8] == checksum
  end

  def test_manufacture
    assert @tester.manufacture.match(/\w+\.?/)
  end

  def test_flexible_key
    flexible_key = @tester.instance_variable_get('@flexible_key')

    assert flexible_key == :vehicle
  end

  def test_mileage
    mileage = @tester.mileage
    assert mileage >= 10_000
    assert mileage < 90_000
  end

  def test_year
    year = @tester.year
    assert year >= 2005
    assert year <= ::Time.now.year
  end

  def test_make
    assert @tester.make.match(/\w+\.?/)
  end

  def test_model
    assert @tester.model.match(/\w+\.?/)
  end

  def test_model_with_make
    assert @tester.model('Toyota').match(/\w+\.?/)
  end

  def test_make_and_model
    assert @tester.make_and_model.match(/\w+\s\w+/)
  end

  def test_style
    assert @tester.style.match(/\w+\.?/)
  end

  def test_color
    assert @tester.color.match(/\w+\.?/)
  end

  def test_transmission
    assert @tester.transmission.match(/\w+\.?/)
  end

  def test_drive_type
    assert @tester.drive_type.match(/\w+\.?/)
  end

  def test_fuel_type
    assert @tester.fuel_type.match(/\w+\.?/)
  end

  def test_door_count
    assert @tester.door_count.match(/\d Door/)
  end

  def test_car_type
    assert @tester.car_type.match(/\w+\.?/)
  end

  def test_engine
    assert @tester.engine.match(/\d Cylinder Engine/)
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

  private

  def transliterate(character)
    @vin_chars.index(character) % 10
  end

  def calculate_vin_weight(character, idx)
    transliterate(character) * @vin_map.index(@vin_weights[idx])
  end

  def vin_checksum(vin)
    checksum_index = vin.split('').each_with_index.map(&method(:calculate_vin_weight)).inject(:+)
    @vin_map[checksum_index % 11]
  end
end
