# frozen_string_literal: true

module Faker
  class Placeholdit < Base
    class << self
      extend Gem::Deprecate

      # rubocop:disable Metrics/ParameterLists
      # @deprecated Replaced by Faker::Image.placeholdit.
      def image(legacy_size = NOT_GIVEN, legacy_format = NOT_GIVEN, legacy_background_color = NOT_GIVEN, legacy_text_color = NOT_GIVEN, legacy_text = NOT_GIVEN, size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :size if legacy_size != NOT_GIVEN
          keywords << :format if legacy_format != NOT_GIVEN
          keywords << :background_color if legacy_background_color != NOT_GIVEN
          keywords << :text_color if legacy_text_color != NOT_GIVEN
          keywords << :text if legacy_text != NOT_GIVEN
        end

        Faker::Image.placeholdit(size: size, format: format, background_color: background_color, text_color: text_color, text: text)
      end

      deprecate :image, "Faker::Image.placeholdit", 2020, 05
    end
  end
end
