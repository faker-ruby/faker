# frozen_string_literal: true

module Faker
  class Vehicle < Base
    flexible :vehicle

    MILEAGE_MIN = 10_000
    MILEAGE_MAX = 90_000
    VIN_LETTERS = 'ABCDEFGHJKLMNPRSTUVWXYZ'
    VIN_MAP = '0123456789X'
    VIN_WEIGHTS = '8765432X098765432'
    VIN_REGEX = /^[A-Z0-9]{3}[A-Z0-9]{5}[A-Z0-9]{1}[A-Z0-9]{1}[A-Z0-0]{1}[A-Z0-9]{1}\d{5}$/
    SG_CHECKSUM_WEIGHTS = [3, 14, 2, 12, 2, 11, 1].freeze
    SG_CHECKSUM_CHARS = 'AYUSPLJGDBZXTRMKHEC'

    class << self
      def vin
        regexify(VIN_REGEX)
      end

      def manufacture
        fetch('vehicle.manufacture')
      end

      def make
        fetch('vehicle.makes')
      end

      def model(legacy_make_of_model = NOT_GIVEN, make_of_model: '')
        if legacy_make_of_model != NOT_GIVEN
          warn_with_uplevel 'Passing `make_of_model` with the 1st argument of `Vehicle.model` is deprecated. Use keyword argument like `Vehicle.model(make_of_model: ...)` instead.', uplevel: 1
          make_of_model = legacy_make_of_model
        end

        return fetch("vehicle.models_by_make.#{make}") if make_of_model.empty?

        fetch("vehicle.models_by_make.#{make_of_model}")
      end

      def make_and_model
        m = make

        "#{m} #{model(make_of_model: m)}"
      end

      def style
        fetch('vehicle.styles')
      end

      def color
        fetch('vehicle.colors')
      end

      def transmission
        fetch('vehicle.transmissions')
      end

      def drive_type
        fetch('vehicle.drive_types')
      end

      def fuel_type
        fetch('vehicle.fuel_types')
      end

      def car_type
        fetch('vehicle.car_types')
      end

      def engine
        "#{sample(fetch_all('vehicle.doors'))} #{fetch('vehicle.cylinder_engine')}"
      end

      alias engine_size engine

      def car_options
        Array.new(rand(5...10)) { fetch('vehicle.car_options') }
      end

      def standard_specs
        Array.new(rand(5...10)) { fetch('vehicle.standard_specs') }
      end

      def doors
        sample(fetch_all('vehicle.doors'))
      end
      alias door_count doors

      def year
        Faker::Time.backward(days: rand_in_range(365, 5475), period: :all, format: '%Y').to_i
      end

      def mileage(legacy_min = NOT_GIVEN, legacy_max = NOT_GIVEN, min: MILEAGE_MIN, max: MILEAGE_MAX)
        if legacy_min != NOT_GIVEN
          warn_with_uplevel 'Passing `min` with the 1st argument of `Vehicle.mileage` is deprecated. Use keyword argument like `Vehicle.mileage(min: ...)` instead.', uplevel: 1
          min = legacy_min
        end
        if legacy_max != NOT_GIVEN
          warn_with_uplevel 'Passing `max` with the 2nd argument of `Vehicle.mileage` is deprecated. Use keyword argument like `Vehicle.mileage(max: ...)` instead.', uplevel: 1
          max = legacy_max
        end

        rand_in_range(min, max)
      end

      alias kilometrage mileage

      def license_plate(legacy_state_abreviation = NOT_GIVEN, state_abreviation: '')
        if legacy_state_abreviation != NOT_GIVEN
          warn_with_uplevel 'Passing `state_abreviation` with the 1st argument of `Vehicle.license_plate` is deprecated. Use keyword argument like `Vehicle.license_plate(state_abreviation: ...)` instead.', uplevel: 1
          state_abreviation = legacy_state_abreviation
        end

        return regexify(bothify(fetch('vehicle.license_plate'))) if state_abreviation.empty?

        key = 'vehicle.license_plate_by_state.' + state_abreviation
        regexify(bothify(fetch(key)))
      end

      def singapore_license_plate
        key = 'vehicle.license_plate'
        plate_number = regexify(bothify(fetch(key)))
        "#{plate_number}#{singapore_checksum(plate_number)}"
      end

      private

      def first_eight(number)
        return number[0...8] unless number.nil?

        regexify(VIN_REGEX)
      end
      alias last_eight first_eight

      def calculate_vin_check_digit(vin)
        sum = 0

        vin.each_char.with_index do |c, i|
          n = vin_char_to_number(c).to_i
          weight = VIN_WEIGHTS[i].to_i
          sum += weight * n
        end

        mod = sum % 11
        mod == 10 ? 'X' : mod
      end

      def vin_char_to_number(char)
        index = VIN_LETTERS.split('').index(char)

        return char.to_i if index.nil?

        VIN_MAP[index]
      end

      def singapore_checksum(plate_number)
        padded_alphabets = format('%3s', plate_number[/^[A-Z]+/]).tr(' ', '-').split('')
        padded_digits = format('%04d', plate_number[/\d+/]).split('').map(&:to_i)
        sum = [*padded_alphabets, *padded_digits].each_with_index.reduce(0) do |memo, (char, i)|
          value = char.is_a?(Integer) ? char : char.ord - 64
          memo + (SG_CHECKSUM_WEIGHTS[i] * value)
        end

        SG_CHECKSUM_CHARS.split('')[sum % 19]
      end
    end
  end
end
