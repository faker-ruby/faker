# frozen_string_literal: true

module Faker
  class Fillmurray < Base
    class << self
      # rubocop:disable Metrics/ParameterLists
      def image(legacy_grayscale = NOT_GIVEN, legacy_width = NOT_GIVEN, legacy_height = NOT_GIVEN, grayscale: false, width: 200, height: 200)
        # rubocop:enable Metrics/ParameterLists
        if legacy_grayscale != NOT_GIVEN
          warn_with_uplevel 'Passing `grayscale` with the 1st argument of `Fillmurray.image` is deprecated. Use keyword argument like `Fillmurray.image(grayscale: ...)` instead.', uplevel: 1
          grayscale = legacy_grayscale
        end
        if legacy_width != NOT_GIVEN
          warn_with_uplevel 'Passing `width` with the 2nd argument of `Fillmurray.image` is deprecated. Use keyword argument like `Fillmurray.image(width: ...)` instead.', uplevel: 1
          width = legacy_width
        end
        if legacy_height != NOT_GIVEN
          warn_with_uplevel 'Passing `height` with the 3rd argument of `Fillmurray.image` is deprecated. Use keyword argument like `Fillmurray.image(height: ...)` instead.', uplevel: 1
          height = legacy_height
        end

        raise ArgumentError, 'Width should be a number' unless width.to_s =~ /^\d+$/
        raise ArgumentError, 'Height should be a number' unless height.to_s =~ /^\d+$/
        raise ArgumentError, 'Grayscale should be a boolean' unless [true, false].include?(grayscale)

        "https://www.fillmurray.com#{'/g' if grayscale == true}/#{width}/#{height}"
      end
    end
  end
end
