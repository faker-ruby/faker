# frozen_string_literal: true

module Faker
  class Avatar < Base
    class << self
      SUPPORTED_FORMATS = %w[png jpg bmp].freeze

      # rubocop:disable Metrics/ParameterLists
      def image(legacy_slug = NOT_GIVEN, legacy_size = NOT_GIVEN, legacy_format = NOT_GIVEN, legacy_set = NOT_GIVEN, legacy_bgset = NOT_GIVEN, slug: nil, size: '300x300', format: 'png', set: 'set1', bgset: nil)
        # rubocop:enable Metrics/ParameterLists
        if legacy_slug != NOT_GIVEN
          warn_with_uplevel 'Passing `slug` with the 1st argument of `Avatar.image` is deprecated. Use keyword argument like `Avatar.image(slug: ...)` instead.', uplevel: 1
          slug = legacy_slug
        end
        if legacy_size != NOT_GIVEN
          warn_with_uplevel 'Passing `size` with the 2nd argument of `Avatar.image` is deprecated. Use keyword argument like `Avatar.image(size: ...)` instead.', uplevel: 1
          size = legacy_size
        end
        if legacy_format != NOT_GIVEN
          warn_with_uplevel 'Passing `format` with the 3rd argument of `Avatar.image` is deprecated. Use keyword argument like `Avatar.image(format: ...)` instead.', uplevel: 1
          format = legacy_format
        end
        if legacy_set != NOT_GIVEN
          warn_with_uplevel 'Passing `set` with the 4th argument of `Avatar.image` is deprecated. Use keyword argument like `Avatar.image(set: ...)` instead.', uplevel: 1
          set = legacy_set
        end
        if legacy_bgset != NOT_GIVEN
          warn_with_uplevel 'Passing `bgset` with the 5th argument of `Avatar.image` is deprecated. Use keyword argument like `Avatar.image(bgset: ...)` instead.', uplevel: 1
          bgset = legacy_bgset
        end

        raise ArgumentError, 'Size should be specified in format 300x300' unless size =~ /^[0-9]+x[0-9]+$/
        raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}" unless SUPPORTED_FORMATS.include?(format)

        slug ||= Faker::Lorem.words.join
        bgset_query = "&bgset=#{bgset}" if bgset
        "https://robohash.org/#{slug}.#{format}?size=#{size}&set=#{set}#{bgset_query}"
      end
    end
  end
end
