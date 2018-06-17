module Faker
  class Vehicle < Base
    flexible :vehicle

    VIN_REGEX = /^[A-HJ-NPRS-Z0-9]{8}$/
    VIN_LETTERS = 'ABCDEFGHJKLMNPRSTUVWXYZ'.freeze
    VIN_MAP = '12345678123457923456789'.freeze
    VIN_WEIGHTS = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2].freeze
    MILEAGE_MIN = 10_000
    MILEAGE_MAX = 90_000

    class << self
      def vin(number = nil)
        first_eight = first_eight(number)
        last_eight = last_eight(number)
        check_digit = calculate_vin_check_digit(first_eight + '0' + last_eight).to_s
        first_eight + check_digit + last_eight
      end

      def manufacture
        fetch('vehicle.manufacture')
      end

      def make
        fetch('vehicle.makes')
      end

      def model(make_of_model = '')
        return fetch("vehicle.models_by_make.#{make}") if make_of_model.empty?
        fetch("vehicle.models_by_make.#{make_of_model}")
      end

      def make_and_model
        m = make
        "#{m} #{model(m)}"
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
        Faker::Time.backward(rand_in_range(365, 5475), :all, '%Y').to_i
      end

      def mileage(min = MILEAGE_MIN, max = MILEAGE_MAX)
        rand_in_range(min, max)
      end

      alias kilometrage mileage

      def license_plate(state_abreviation = '')
        if state_abreviation.empty?
          return regexify(bothify(fetch('vehicle.license_plate')))
        end
        key = 'vehicle.license_plate_by_state.' + state_abreviation
        regexify(bothify(fetch(key)))
      end

      private

      def first_eight(number)
        return number[0...8] unless number.nil?
        regexify(VIN_REGEX)
      end

      def last_eight(number)
        return number[0...8] unless number.nil?
        regexify(VIN_REGEX)
      end

      def calculate_vin_check_digit(vin)
        sum = 0
        vin.each_char.with_index do |c, i|
          n = vin_char_to_number(c).to_i
          weight = VIN_WEIGHTS[i]
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
    end
  end
end
