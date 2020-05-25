# frozen_string_literal: true

module Faker
  class Placeholdit < Base
    class << self
      extend Gem::Deprecate

      ##
      # Produces a random placeholder image from https://placehold.it.
      #
      # @param size [String] Specifies the image's size, dimensions separated by 'x'.
      # @param format [String] Specifies the image's extension.
      # @param background_color [String, Symbol] Specifies the background color, either in hexadecimal format (without #) or as :random.
      # @param text_color [String, Symbol] Specifies the text color, either in hexadecimal format (without #) or as :random.
      # @param text [String] Specifies a custom text to be used.
      # @return [String]
      #
      # @example
      #     # Keyword arguments: size, format, background_color, text_color, text
      #   Faker::Placeholdit.image #=> "https://placehold.it/300x300.png"
      #   Faker::Placeholdit.image(size: '50x50') #=> "https://placehold.it/50x50.png"
      #   Faker::Placeholdit.image(size: '50x50', format: 'jpg') #=> "https://placehold.it/50x50.jpg"
      #   Faker::Placeholdit.image(size: '50x50', format: 'gif', background_color: 'ffffff') #=> "https://placehold.it/50x50.gif/ffffff"
      #   Faker::Placeholdit.image(size: '50x50', format: 'jpeg', background_color: :random) #=> "https://placehold.it/50x50.jpeg/39eba7"
      #   Faker::Placeholdit.image(size: '50x50', format: 'jpeg', background_color: 'ffffff', text_color: '000') #=> "https://placehold.it/50x50.jpeg/ffffff/000"
      #   Faker::Placeholdit.image(size: '50x50', format: 'jpg', background_color: 'ffffff', text_color: '000', text: 'Some Custom Text') #=> "https://placehold.it/50x50.jpg/ffffff/000?text=Some Custom Text"
      #
      # @faker.version 1.6.0
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

      deprecate :image, 'Faker::Image.placeholdit', 2020, 05
    end
  end
end
