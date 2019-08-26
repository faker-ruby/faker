# frozen_string_literal: true

module Faker
  class Address < Base
    flexible :address

    class << self
      def city(legacy_options = NOT_GIVEN, options: {})
        if legacy_options != NOT_GIVEN
          warn_with_uplevel 'Passing `options` with the 1st argument of `Address.city` is deprecated. Use keyword argument like `Address.city(options: ...)` instead.', uplevel: 1
          options = legacy_options
        end

        parse(options[:with_state] ? 'address.city_with_state' : 'address.city')
      end

      def street_name
        parse('address.street_name')
      end

      def street_address(legacy_include_secondary = NOT_GIVEN, include_secondary: false)
        if legacy_include_secondary != NOT_GIVEN
          warn_with_uplevel 'Passing `include_secondary` with the 1st argument of `Address.street_address` is deprecated. Use keyword argument like `Address.street_address(include_secondary: ...)` instead.', uplevel: 1
          include_secondary = legacy_include_secondary
        end

        numerify(parse('address.street_address') + (include_secondary ? ' ' + secondary_address : ''))
      end

      def secondary_address
        bothify(fetch('address.secondary_address'))
      end

      def building_number
        bothify(fetch('address.building_number'))
      end

      def community
        parse('address.community')
      end

      def zip_code(legacy_state_abbreviation = NOT_GIVEN, state_abbreviation: '')
        if legacy_state_abbreviation != NOT_GIVEN
          warn_with_uplevel 'Passing `state_abbreviation` with the 1st argument of `Address.zip_code` is deprecated. Use keyword argument like `Address.zip_code(state_abbreviation: ...)` instead.', uplevel: 1
          state_abbreviation = legacy_state_abbreviation
        end

        if state_abbreviation.empty?
          letterified_string = letterify(fetch('address.postcode'))
          return numerify(letterified_string, leading_zero: true)
        end

        # provide a zip code that is valid for the state provided
        # see http://www.fincen.gov/forms/files/us_state_territory_zip_codes.pdf
        bothify(fetch('address.postcode_by_state.' + state_abbreviation))
      end

      def time_zone
        fetch('address.time_zone')
      end

      alias zip zip_code
      alias postcode zip_code

      def street_suffix
        fetch('address.street_suffix')
      end

      def city_suffix
        fetch('address.city_suffix')
      end

      def city_prefix
        fetch('address.city_prefix')
      end

      def state_abbr
        fetch('address.state_abbr')
      end

      def state
        fetch('address.state')
      end

      def country
        fetch('address.country')
      end

      def country_by_code(legacy_code = NOT_GIVEN, code: 'US')
        if legacy_code != NOT_GIVEN
          warn_with_uplevel 'Passing `code` with the 1st argument of `Address.country_by_code` is deprecated. Use keyword argument like `Address.country_by_code(code: ...)` instead.', uplevel: 1
          code = legacy_code
        end

        fetch('address.country_by_code.' + code)
      end

      def country_name_to_code(legacy_name = NOT_GIVEN, name: 'united_states')
        if legacy_name != NOT_GIVEN
          warn_with_uplevel 'Passing `name` with the 1st argument of `Address.country_name_to_code` is deprecated. Use keyword argument like `Address.country_name_to_code(name: ...)` instead.', uplevel: 1
          name = legacy_name
        end

        fetch('address.country_by_name.' + name)
      end

      def country_code
        fetch('address.country_code')
      end

      def country_code_long
        fetch('address.country_code_long')
      end

      def latitude
        ((rand * 180) - 90).to_f
      end

      def longitude
        ((rand * 360) - 180).to_f
      end

      def full_address
        parse('address.full_address')
      end
    end
  end
end
