# frozen_string_literal: true

module Faker
  class Fillmurray < Base
    class << self
      # rubocop:disable Metrics/ParameterLists
      def image(legacy_grayscale = NOT_GIVEN, legacy_width = NOT_GIVEN, legacy_height = NOT_GIVEN, grayscale: false, width: 200, height: 200)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :grayscale if legacy_grayscale != NOT_GIVEN
          keywords << :width if legacy_width != NOT_GIVEN
          keywords << :height if legacy_height != NOT_GIVEN
        end

        raise ArgumentError, 'Width should be a number' unless width.to_s =~ /^\d+$/
        raise ArgumentError, 'Height should be a number' unless height.to_s =~ /^\d+$/
        raise ArgumentError, 'Grayscale should be a boolean' unless [true, false].include?(grayscale)

        "https://www.fillmurray.com#{'/g' if grayscale == true}/#{width}/#{height}"
      end
    end
  end
end
