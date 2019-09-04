# frozen_string_literal: true

module Faker
  class Avatar < Base
    class << self
      SUPPORTED_FORMATS = %w[png jpg bmp].freeze

      # rubocop:disable Metrics/ParameterLists
      def image(legacy_slug = NOT_GIVEN, legacy_size = NOT_GIVEN, legacy_format = NOT_GIVEN, legacy_set = NOT_GIVEN, legacy_bgset = NOT_GIVEN, slug: nil, size: '300x300', format: 'png', set: 'set1', bgset: nil)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :slug if legacy_slug != NOT_GIVEN
          keywords << :size if legacy_size != NOT_GIVEN
          keywords << :format if legacy_format != NOT_GIVEN
          keywords << :set if legacy_set != NOT_GIVEN
          keywords << :bgset if legacy_bgset != NOT_GIVEN
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
