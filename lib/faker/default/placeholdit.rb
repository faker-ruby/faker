# frozen_string_literal: true

module Faker
  class Placeholdit < Base
    class << self
      SUPPORTED_FORMATS = %w[png jpg gif jpeg].freeze

      # rubocop:disable Metrics/ParameterLists
      def image(legacy_size = NOT_GIVEN, legacy_format = NOT_GIVEN, legacy_background_color = NOT_GIVEN, legacy_text_color = NOT_GIVEN, legacy_text = NOT_GIVEN, size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil)
        # rubocop:enable Metrics/ParameterLists
        if legacy_size != NOT_GIVEN
          warn_with_uplevel 'Passing `size` with the 1st argument of `Placeholdit.image` is deprecated. Use keyword argument like `Placeholdit.image(size: ...)` instead.', uplevel: 1
          size = legacy_size
        end
        if legacy_format != NOT_GIVEN
          warn_with_uplevel 'Passing `format` with the 2nd argument of `Placeholdit.image` is deprecated. Use keyword argument like `Placeholdit.image(format: ...)` instead.', uplevel: 1
          format = legacy_format
        end
        if legacy_background_color != NOT_GIVEN
          warn_with_uplevel 'Passing `background_color` with the 3rd argument of `Placeholdit.image` is deprecated. Use keyword argument like `Placeholdit.image(background_color: ...)` instead.', uplevel: 1
          background_color = legacy_background_color
        end
        if legacy_text_color != NOT_GIVEN
          warn_with_uplevel 'Passing `text_color` with the 4th argument of `Placeholdit.image` is deprecated. Use keyword argument like `Placeholdit.image(text_color: ...)` instead.', uplevel: 1
          text_color = legacy_text_color
        end
        if legacy_text != NOT_GIVEN
          warn_with_uplevel 'Passing `text` with the 5th argument of `Placeholdit.image` is deprecated. Use keyword argument like `Placeholdit.image(text: ...)` instead.', uplevel: 1
          text = legacy_text
        end

        background_color = generate_color if background_color == :random
        text_color = generate_color if text_color == :random

        raise ArgumentError, 'Size should be specified in format 300x300' unless size =~ /^[0-9]+x[0-9]+$/
        raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}" unless SUPPORTED_FORMATS.include?(format)
        raise ArgumentError, "background_color must be a hex value without '#'" unless background_color.nil? || background_color =~ /((?:^\h{3}$)|(?:^\h{6}$)){1}(?!.*\H)/
        raise ArgumentError, "text_color must be a hex value without '#'" unless text_color.nil? || text_color =~ /((?:^\h{3}$)|(?:^\h{6}$)){1}(?!.*\H)/

        image_url = "https://placehold.it/#{size}.#{format}"
        image_url += "/#{background_color}" if background_color
        image_url += "/#{text_color}" if text_color
        image_url += "?text=#{text}" if text
        image_url
      end

      private

      def generate_color
        format('%06x', (rand * 0xffffff))
      end
    end
  end
end
