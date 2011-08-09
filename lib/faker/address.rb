module Faker
  class Address < Base
    flexible :address

    class << self
      def city
        translated_city_format || default_city_format
      end

      def translated_city_format
        formats = I18n.translate(:faker)[:address][:city_formats]
        if formats
          formats.rand.collect {|method| self.send(method) }.join
        end
      end

      def default_city_format
        [
          '%s %s%s' % [city_prefix, city_root, city_suffix],
          '%s %s' % [city_prefix, city_root],
          '%s%s' % [city_root, city_suffix],
          '%s%s' % [city_root(:last_name), city_suffix],
        ].rand
      end

      def city_root(defaults_to = :first_name)
        translations = I18n.translate(:faker)[:address][:city_root]
        return translations ? translations.rand : Name.send(defaults_to)
      end

      def street_name
        translated_street_name_format || default_street_name_format
      end

      def translated_street_name_format
        formats = I18n.translate(:faker)[:address][:street_name_formats]
        if formats
          formats.rand.collect {|method| self.send(method) }.join
        end
      end

      def default_street_name_format
        [
          Proc.new { [Name.last_name, street_suffix].join(' ') },
          Proc.new { [Name.first_name, street_suffix].join(' ') }
        ].rand.call
      end

      def street_address(include_secondary = false)
        numerify("#{fetch('address.street_address')} #{street_name}#{' ' + secondary_address if include_secondary}")
      end

      def secondary_address
        bothify(fetch('address.secondary_address'))
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

      # Deprecated
      alias_method :earth_country, :country
      alias_method :us_state, :state
      alias_method :us_state_abbr, :state_abbr
      alias_method :uk_postcode, :zip_code
      def uk_county; county; end

    end
  end
end
