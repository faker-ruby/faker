# frozen_string_literal: true

module Faker
  class Avatar < Base
    class << self
      extend Gem::Deprecate

      # @private
      SUPPORTED_FORMATS = %w[png jpg bmp].freeze

      # rubocop:disable Metrics/ParameterLists

      ##
      # Produces a URL for an avatar from robohash.org
      #
      # @deprecated Replaced by Faker::Image.robohash.
      #
      # @param slug [String, nil]
      # @param size [String] image size in pixels, in the format of 'AxB'
      # @param format [String] The image file format
      # @param set [String] The avatar set to use
      # @param bgset [String, nil] The background set to use
      # @return [String] A robohash.org URL
      #
      # @example
      #   Faker::Avatar.image
      #     #=> "https://robohash.org/sitsequiquia.png?size=300x300&set=set1"
      # @example
      #   Faker::Avatar.image(slug: "my-own-slug")
      #     #=> "https://robohash.org/my-own-slug.png?size=300x300&set=set1"
      # @example
      #   Faker::Avatar.image(slug: "my-own-slug", size: "50x50")
      #     #=> "https://robohash.org/my-own-slug.png?size=50x50&set=set1"
      # @example
      #   Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
      #     #=> "https://robohash.org/my-own-slug.jpg?size=50x50&set=set1"
      # @example
      #   Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp")
      #     #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1"
      # @example
      #   Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp", set: "set1", bgset: "bg1")
      #     #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1&bgset=bg1"
      #
      # @faker.version 1.4.3
      def image(legacy_slug = NOT_GIVEN, legacy_size = NOT_GIVEN, legacy_format = NOT_GIVEN, legacy_set = NOT_GIVEN, legacy_bgset = NOT_GIVEN, slug: nil, size: '300x300', format: 'png', set: 'set1', bgset: nil)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :slug if legacy_slug != NOT_GIVEN
          keywords << :size if legacy_size != NOT_GIVEN
          keywords << :format if legacy_format != NOT_GIVEN
          keywords << :set if legacy_set != NOT_GIVEN
          keywords << :bgset if legacy_bgset != NOT_GIVEN
        end

        Faker::Image.robohash(slug: slug, size: size, format: format, set: set, bgset: bgset)
      end

      deprecate :image, 'Faker::Image.robohash', 2020, 05
    end
  end
end
