# frozen_string_literal: true

module Faker
  class LoremFlickr < Base
    class << self
      SUPPORTED_COLORIZATIONS = %w[red green blue].freeze

      # rubocop:disable Metrics/ParameterLists
      def image(legacy_size = NOT_GIVEN, legacy_search_terms = NOT_GIVEN, legacy_match_all = NOT_GIVEN, size: '300x300', search_terms: [], match_all: false)
        # rubocop:enable Metrics/ParameterLists
        if legacy_size != NOT_GIVEN
          warn_with_uplevel 'Passing `size` with the 1st argument of `LoremFlickr.image` is deprecated. Use keyword argument like `LoremFlickr.image(size: ...)` instead.', uplevel: 1
          size = legacy_size
        end
        if legacy_search_terms != NOT_GIVEN
          warn_with_uplevel 'Passing `search_terms` with the 2nd argument of `LoremFlickr.image` is deprecated. Use keyword argument like `LoremFlickr.image(search_terms: ...)` instead.', uplevel: 1
          search_terms = legacy_search_terms
        end
        if legacy_match_all != NOT_GIVEN
          warn_with_uplevel 'Passing `match_all` with the 3rd argument of `LoremFlickr.image` is deprecated. Use keyword argument like `LoremFlickr.image(match_all: ...)` instead.', uplevel: 1
          match_all = legacy_match_all
        end

        build_url(size, nil, search_terms, match_all)
      end

      # rubocop:disable Metrics/ParameterLists
      def grayscale_image(legacy_size = NOT_GIVEN, legacy_search_terms = NOT_GIVEN, legacy_match_all = NOT_GIVEN, size: '300x300', search_terms: ['all'], match_all: false)
        # rubocop:enable Metrics/ParameterLists
        if legacy_size != NOT_GIVEN
          warn_with_uplevel 'Passing `size` with the 1st argument of `LoremFlickr.grayscale_image` is deprecated. Use keyword argument like `LoremFlickr.grayscale_image(size: ...)` instead.', uplevel: 1
          size = legacy_size
        end
        if legacy_search_terms != NOT_GIVEN
          warn_with_uplevel 'Passing `search_terms` with the 2nd argument of `LoremFlickr.grayscale_image` is deprecated. Use keyword argument like `LoremFlickr.grayscale_image(search_terms: ...)` instead.', uplevel: 1
          search_terms = legacy_search_terms
        end
        if legacy_match_all != NOT_GIVEN
          warn_with_uplevel 'Passing `match_all` with the 3rd argument of `LoremFlickr.grayscale_image` is deprecated. Use keyword argument like `LoremFlickr.grayscale_image(match_all: ...)` instead.', uplevel: 1
          match_all = legacy_match_all
        end

        raise ArgumentError, 'Search terms must be specified for grayscale images' unless search_terms.any?

        build_url(size, 'g', search_terms, match_all)
      end

      # rubocop:disable Metrics/ParameterLists
      def pixelated_image(legacy_size = NOT_GIVEN, legacy_search_terms = NOT_GIVEN, legacy_match_all = NOT_GIVEN, size: '300x300', search_terms: ['all'], match_all: false)
        # rubocop:enable Metrics/ParameterLists
        if legacy_size != NOT_GIVEN
          warn_with_uplevel 'Passing `size` with the 1st argument of `LoremFlickr.pixelated_image` is deprecated. Use keyword argument like `LoremFlickr.pixelated_image(size: ...)` instead.', uplevel: 1
          size = legacy_size
        end
        if legacy_search_terms != NOT_GIVEN
          warn_with_uplevel 'Passing `search_terms` with the 2nd argument of `LoremFlickr.pixelated_image` is deprecated. Use keyword argument like `LoremFlickr.pixelated_image(search_terms: ...)` instead.', uplevel: 1
          search_terms = legacy_search_terms
        end
        if legacy_match_all != NOT_GIVEN
          warn_with_uplevel 'Passing `match_all` with the 3rd argument of `LoremFlickr.pixelated_image` is deprecated. Use keyword argument like `LoremFlickr.pixelated_image(match_all: ...)` instead.', uplevel: 1
          match_all = legacy_match_all
        end

        raise ArgumentError, 'Search terms must be specified for pixelated images' unless search_terms.any?

        build_url(size, 'p', search_terms, match_all)
      end

      # rubocop:disable Metrics/ParameterLists
      def colorized_image(legacy_size = NOT_GIVEN, legacy_color = NOT_GIVEN, legacy_search_terms = NOT_GIVEN, legacy_match_all = NOT_GIVEN, size: '300x300', color: 'red', search_terms: ['all'], match_all: false)
        # rubocop:enable Metrics/ParameterLists
        if legacy_size != NOT_GIVEN
          warn_with_uplevel 'Passing `size` with the 1st argument of `LoremFlickr.colorized_image` is deprecated. Use keyword argument like `LoremFlickr.colorized_image(size: ...)` instead.', uplevel: 1
          size = legacy_size
        end
        if legacy_color != NOT_GIVEN
          warn_with_uplevel 'Passing `color` with the 2nd argument of `LoremFlickr.colorized_image` is deprecated. Use keyword argument like `LoremFlickr.colorized_image(color: ...)` instead.', uplevel: 1
          color = legacy_color
        end
        if legacy_search_terms != NOT_GIVEN
          warn_with_uplevel 'Passing `search_terms` with the 3rd argument of `LoremFlickr.colorized_image` is deprecated. Use keyword argument like `LoremFlickr.colorized_image(search_terms: ...)` instead.', uplevel: 1
          search_terms = legacy_search_terms
        end
        if legacy_match_all != NOT_GIVEN
          warn_with_uplevel 'Passing `match_all` with the 4th argument of `LoremFlickr.colorized_image` is deprecated. Use keyword argument like `LoremFlickr.colorized_image(match_all: ...)` instead.', uplevel: 1
          match_all = legacy_match_all
        end

        raise ArgumentError, 'Search terms must be specified for colorized images' unless search_terms.any?
        raise ArgumentError, "Supported colorizations are #{SUPPORTED_COLORIZATIONS.join(', ')}" unless SUPPORTED_COLORIZATIONS.include?(color)

        build_url(size, color, search_terms, match_all)
      end

      private

      def build_url(size, format, search_terms, match_all)
        raise ArgumentError, 'Size should be specified in format 300x300' unless size =~ /^[0-9]+x[0-9]+$/

        url_parts = ['https://loremflickr.com']
        url_parts << format
        url_parts += size.split('x')
        url_parts << search_terms.compact.join(',') if search_terms.any?
        url_parts << 'all' if match_all
        url_parts.compact.join('/')
      end
    end
  end
end
