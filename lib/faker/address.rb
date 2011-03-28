module Faker
  class Address < Base
    class << self
      def city
        [
          '%s %s%s' % [city_prefix, Name.first_name, city_suffix],
          '%s %s' % [city_prefix, Name.first_name],
          '%s%s' % [Name.first_name, city_suffix],
          '%s%s' % [Name.last_name, city_suffix],
        ].rand
      end

      def street_name
        if Faker::Config.locale == :de
          fetch('address.street_name')
        else
          [
            Proc.new { [Name.last_name, street_suffix].join(' ') },
            Proc.new { [Name.first_name, street_suffix].join(' ') }
          ].rand.call
        end
      end

      def street_address(include_secondary = false)
        if Faker::Config.locale == :de
          numerify("#{street_name} #{fetch('address.street_address')}#{' ' + secondary_address if include_secondary}")
        else
          numerify("#{fetch('address.street_address')} #{street_name}#{' ' + secondary_address if include_secondary}")
        end
      end

      def secondary_address
        numerify(fetch('address.secondary_address'))
      end

      def zip_code
        bothify(fetch('address.postcode')).upcase
      end
      alias_method :zip, :zip_code
      alias_method :postcode, :zip_code
      
      def street_suffix; fetch('address.street_suffix'); end
      def city_suffix;   fetch('address.city_suffix');   end
      def city_prefix;   fetch('address.city_prefix');   end
      def state_abbr;    fetch('address.state_abbr');    end
      def state;         fetch('address.state');         end
      def country;       fetch('address.country');       end

      # You can add whatever you want to the locale file, and it will get 
      # caught here... e.g., create a country_code array in your locale, 
      # then you can call #country_code and it will act like #country
      def method_missing(m, *args, &block)
        # Use the alternate form of translate to get a nil rather than a "missing translation" string
        if translation = I18n.translate(:faker, :locale => Faker::Config.locale)[:address][m]
          translation.respond_to?(:rand) ? translation.rand : translation
        else
          super
        end
      end
      
      # Deprecated
      alias_method :earth_country, :country
      alias_method :us_state, :state
      alias_method :us_state_abbr, :state_abbr
      alias_method :uk_postcode, :zip_code
      def uk_county; county; end

    end
  end
end

# require "faker"; Faker::Config.locale = :de
# Faker::Address.street_name
# I18n.locale
# Faker::Config.locale
