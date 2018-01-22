module Faker
  class Vehicle < Base
    flexible :vehicle

    VIN_REGEX = /^[A-HJ-NPRS-Z0-9]{8}$/
    VIN_LETTERS = 'ABCDEFGHJKLMNPRSTUVWXYZ'.freeze
    VIN_MAP = '12345678123457923456789'.freeze
    VIN_WEIGHTS = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2].freeze

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

      alias make manufacture

      def color
        fetch('vehicle.colors')
      end

      def transmission
        fetch('vehicle.transmissions')
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
