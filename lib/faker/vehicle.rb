module Faker
  class Vehicle < Base
    flexible :vehicle

    VIN_CHARS = '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ'.freeze
    VIN_MAP = '0123456789X'.freeze
    VIN_WEIGHTS = '8765432X098765432'.freeze

    class << self
      # ISO 3779
      def vin
        _, wmi, wmi_ext = sample(fetch_all('vehicle.manufacture'))

        c = VIN_CHARS.split('').reject { |n| n == '.' }
        vehicle_identification_number = wmi.split('').concat(Array.new(14) { sample(c) })
        (12..14).to_a.each_with_index { |n, i| vehicle_identification_number[n] = wmi_ext[i] } unless wmi_ext.nil?
        vehicle_identification_number[10] = fetch('vehicle.year')
        vehicle_identification_number[8] = vin_checksum(vehicle_identification_number)

        vehicle_identification_number.join.upcase
      end

      def manufacture
        sample(fetch_all('vehicle.manufacture')).first
      end

      private

      def calculate_vin_weight(character, idx)
        (VIN_CHARS.index(character) % 10) * VIN_MAP.index(VIN_WEIGHTS[idx])
      end

      def vin_checksum(vehicle_identification_number)
        VIN_MAP[vehicle_identification_number.each_with_index.map(&method(:calculate_vin_weight)).inject(:+) % 11]
      end
    end
  end
end
