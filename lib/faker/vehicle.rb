module Faker
  class Vehicle < Base
    @vin_chars = '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ'
    @vin_map = '0123456789X'
    @vin_weights = '8765432X098765432'

    class << self
      #ISO 3779
      def vin
        manufacture = fetch_all('vehicle.manufacture').sample

        c = @vin_chars.split('').reject{ |n| n == '.'}
        vehicle_identification_number = manufacture["wmi"].split('').concat( Array.new(14) { c.sample } )
        (12..14).to_a.each_with_index { |n, i| vehicle_identification_number[n] = manufacture["win_ext"][i] } unless manufacture["win_ext"].nil?
        vehicle_identification_number[10] = fetch('vehicle.year')
        vehicle_identification_number[8] = vin_checksum(vehicle_identification_number)

        vehicle_identification_number.join.upcase
      end

      def manufacture
        fetch_all('vehicle.manufacture').sample["name"]
      end
      
    private

      def calculate_vin_weight(character, i)
        (@vin_chars.index(character) % 10) * @vin_map.index(@vin_weights [i])
      end

      def vin_checksum(vehicle_identification_number)
        @vin_map[vehicle_identification_number.each_with_index.map(&method(:calculate_vin_weight)).inject(:+) % 11]
      end

    end
  end
end