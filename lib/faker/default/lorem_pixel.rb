# frozen_string_literal: true

module Faker
  class LoremPixel < Base
    class << self
      extend Gem::Deprecate

      # rubocop:disable Metrics/ParameterLists
      def image(legacy_size = NOT_GIVEN, legacy_is_gray = NOT_GIVEN, legacy_category = NOT_GIVEN, legacy_number = NOT_GIVEN, legacy_text = NOT_GIVEN, legacy_secure = NOT_GIVEN, size: '300x300', is_gray: false, category: nil, number: nil, text: nil, secure: true)
        warn_for_deprecated_arguments do |keywords|
          keywords << :size if legacy_size != NOT_GIVEN
          keywords << :is_gray if legacy_is_gray != NOT_GIVEN
          keywords << :category if legacy_category != NOT_GIVEN
          keywords << :number if legacy_number != NOT_GIVEN
          keywords << :text if legacy_text != NOT_GIVEN
          keywords << :secure if legacy_secure != NOT_GIVEN
        end

        Faker::Image.lorem_pixel(size: size, is_gray: is_gray, category: category, number: number, text: text, secure: secure)
      end
      # rubocop:enable Metrics/ParameterLists

      deprecate :image, 'Faker::Image.lorem_pixel', 2020, 05
    end
  end
end
