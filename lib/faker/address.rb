module Faker
  class Address < Base
    flexible :address

    attr_reader :street_address, :city, :postcode, :state, :country

    def initialize(locale)
      I18n.with_locale(locale) do
        @street_address = Address.street_address(rand(2) == 1 ? :include_secondary : false)
        @city = Address.city
        @postcode = Address.postcode
        @state = Address.state
        @country = Address.default_country
      end
    end

    class << self
      def in(locale)
        new(locale)
      end

      def address
        new(I18n.locale)
      end

      def city
        maybe(:city_formats) || default_city_format
      end

      def city_root(defaults_to = :first_name)
        translations = I18n.translate(:faker)[:address][:city_root]
        return translations ? translations.rand : Name.send(defaults_to)
      end

      def street_name
        maybe(:street_name_formats) || default_street_name_format
      end

      def street_address(include_secondary = false)
        address = maybe(:street_address_formats) || default_street_address_format
        address << street_joiner << secondary_address if include_secondary
        address
      end

      def street_joiner
        I18n.translate(:faker)[:address][:street_joiner] || ' '
      end

      def building_number
        numerify(fetch('address.building_number'))
      end

      def secondary_address
        bothify(fetch('address.secondary_address'))
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

      # helper methods
      def default_city_format
        [
          [city_prefix, ' ', city_root, city_suffix],
          [city_prefix, ' ', city_root],
          [city_root, city_suffix],
          [city_root(:last_name), city_suffix],
        ].rand.join
      end

      def default_street_name_format
        [
          [Name.last_name, street_suffix],
          [Name.first_name, street_suffix]
        ].rand.join(' ')
      end

      def default_street_address_format
        [building_number, street_name].join(' ')
      end

      # Deprecated
      alias_method :earth_country, :country
      alias_method :us_state, :state
      alias_method :us_state_abbr, :state_abbr
      alias_method :uk_postcode, :zip_code
      def uk_county; county; end

      private
      def maybe(key)
        formats = I18n.translate(:faker)[:address][key]
        if formats
          formats.rand.collect {|method| self.send(method) }.join
        end
      end

    end
  end
end
