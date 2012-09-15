module Faker
  class Address < Base
    flexible :address

    class << self
      def city
        parse('address.city')
      end

      def street_name
        parse('address.street_name')
      end

      def street_address(include_secondary = false)
        numerify(parse('address.street_address') + (include_secondary ? ' ' + secondary_address : ''))
      end

      def secondary_address
        numerify(fetch('address.secondary_address'))
      end

      def building_number
        bothify(fetch('address.building_number'))
      end

      def zip_code
        bothify(fetch('address.postcode'))
      end
      alias_method :zip, :zip_code
      alias_method :postcode, :zip_code

      def street_suffix; fetch('address.street_suffix'); end
      def city_suffix;   fetch('address.city_suffix');   end
      def city_prefix;   fetch('address.city_prefix');   end
      def state_abbr;    fetch('address.state_abbr');    end
      def state;         fetch('address.state');         end
      def country;       fetch('address.country');       end

      def latitude
        ((rand * 180) - 90).to_s
      end

      def longitude
        ((rand * 360) - 180).to_s
      end

    end
  end
end
