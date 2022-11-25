# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVehicle < Test::Unit::TestCase
  VIN_TRANSLITERATION = { A: 1, B: 2, C: 3, D: 4, E: 5, F: 6, G: 7, H: 8, J: 1, K: 2, L: 3, M: 4, N: 5, P: 7, R: 9, S: 2, T: 3, U: 4, V: 5, W: 6, X: 7, Y: 8, Z: 9 }.freeze
  VIN_WEIGHT = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2].freeze
  WORD_MATCH = /\w+\.?/.freeze
  VALIDITY_MATCH = /^([A-HJ-NPR-Z0-9]){17}$/.freeze

  def setup
    @tester = Faker::Vehicle
  end

  def test_vin
    assert_match Faker::Vehicle::VIN_REGEX, @tester.vin
  end

  def test_vin_checksum
    assert valid_vin_checksum(@tester.vin)
  end

  def test_vin_validity
    100.times do
      assert_match VALIDITY_MATCH, @tester.vin
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

  def valid_vin_checksum(vin)
    if vin.present? && vin =~ /\A[A-HJ-NPR-Z0-9]{17}\z/
      total = 0
      vin.chars.each_with_index do |char, index|
        total += (char =~ /\A\d\z/ ? char.to_i : VIN_TRANSLITERATION[char.to_sym]) * VIN_WEIGHT[index]
      end
      checksum = total % 11
      checksum = "X" if checksum == 10
      return vin[8] == checksum.to_s
    end
    false
  end
end
