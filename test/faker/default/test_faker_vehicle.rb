# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVehicle < Test::Unit::TestCase
  WORD_MATCH = /\w+\.?/.freeze

  def setup
    @tester = Faker::Vehicle
  end

  def test_vin
    assert_match Faker::Vehicle::VIN_REGEX, @tester.vin
  end

  def test_vin_validity
    100.times do
      assert valid_vin(@tester.vin)
    end
  end

  def test_manufacture
    assert_match WORD_MATCH, @tester.manufacture
  end

  def test_color
    assert_match WORD_MATCH, @tester.color
  end

  def test_flexible_key
    assert_equal(:vehicle, @tester.flexible_key)
  end

  def test_transmission
    assert_match WORD_MATCH, @tester.transmission
  end

  def test_drive_type
    assert_match WORD_MATCH, @tester.drive_type
  end

  def test_fuel_type
    assert_match WORD_MATCH, @tester.fuel_type
  end

  def test_style
    assert_match WORD_MATCH, @tester.style
  end

  def test_car_type
    assert_match WORD_MATCH, @tester.car_type
  end

  def test_doors
    doors_condition(@tester.doors)
  end

  def test_engine
    assert_match(/\d Cylinder Engine/, @tester.engine)
  end

  def test_mileage
    mileage = @tester.mileage(min: 5, max: 10)

    assert mileage >= 5 && mileage <= 10
  end

  def test_license_plate
    assert_match WORD_MATCH, @tester.license_plate
  end

  def test_license_plate_with_params
    assert_match WORD_MATCH, @tester.license_plate(state_abbreviation: 'CA')
  end

  def test_make
    assert_match WORD_MATCH, @tester.make
  end

  def test_model
    assert_match WORD_MATCH, @tester.model
  end

  def test_model_with_make
    assert_match WORD_MATCH, @tester.model(make_of_model: 'Toyota')
  end

  def test_make_and_model
    assert_match WORD_MATCH, @tester.make_and_model
  end

  def test_door_count
    doors_condition(@tester.door_count)
  end

  def test_car_options
    car_options = @tester.car_options

    assert car_options.length >= 5 && car_options.length < 10
  end

  def test_standard_specs
    standard_specs = @tester.standard_specs

    assert standard_specs.length >= 5 && standard_specs.length < 10
  end

  def test_version
    assert_match WORD_MATCH, @tester.version
  end

  private

  def doors_condition(doors)
    assert_predicate doors, :positive?
    assert doors.is_a?(Integer)
  end

  def valid_vin(vin)
    if vin && vin =~ Faker::Vehicle::VIN_REGEX
      total = 0
      vin.chars.each_with_index do |char, index|
        value = (char =~ /\A\d\z/ ? char.to_i : Faker::Vehicle::VIN_TRANSLITERATION[char.to_sym])
        total += value * Faker::Vehicle::VIN_WEIGHT[index]
      end
      checksum = total % 11
      checksum = 'X' if checksum == 10
      return vin[8] == checksum.to_s
    end
    false
  end
end
