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
        [
          Proc.new { [Name.last_name, street_suffix].join(' ') },
          Proc.new { [Name.first_name, street_suffix].join(' ') }
        ].rand.call
      end

      def street_address(include_secondary = false)
        numerify("#{I18n.translate('faker.address.street_address').rand} #{street_name}#{' ' + secondary_address if include_secondary}")
      end

      def secondary_address
        numerify(I18n.translate('faker.address.secondary_address').rand)
      end

      def zip_code
        bothify(I18n.translate('faker.address.postcode').rand).upcase
      end
      alias_method :zip, :zip_code
      alias_method :postcode, :zip_code

      %w(street_suffix city_suffix city_prefix state_abbr state country county).each do |meth|
        define_method(meth) do
          I18n.translate("faker.address.#{meth}").rand
        end
      end
      
      # You can add whatever you want to the locale file, and it will get 
      # caught here... e.g., create a country_code array in your locale, 
      # then you can call #country_code and it will act like #country
      def method_missing(m, *args, &block)
        # Use the alternate form of translate to get a nil rather than a "missing translation" string
        if translation = I18n.translate(:faker)[:address][m]
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
      alias_method :uk_county, :county

    end
  end
end