# frozen_string_literal: true

module Faker
  class LoremPixel < Base
    class << self
      SUPPORTED_CATEGORIES = %w[abstract
                                animals
                                business
                                cats
                                city
                                food
                                nightlife
                                fashion
                                people
                                nature
                                sports
                                technics
                                transport].freeze

      # rubocop:disable Metrics/ParameterLists
      def image(legacy_size = NOT_GIVEN, legacy_is_gray = NOT_GIVEN, legacy_category = NOT_GIVEN, legacy_number = NOT_GIVEN, legacy_text = NOT_GIVEN, legacy_secure = NOT_GIVEN, size: '300x300', is_gray: false, category: nil, number: nil, text: nil, secure: true)
        if legacy_size != NOT_GIVEN
          warn_with_uplevel 'Passing `size` with the 1st argument of `LoremPixel.image` is deprecated. Use keyword argument like `LoremPixel.image(size: ...)` instead.', uplevel: 1
          size = legacy_size
        end
        if legacy_is_gray != NOT_GIVEN
          warn_with_uplevel 'Passing `is_gray` with the 2nd argument of `LoremPixel.image` is deprecated. Use keyword argument like `LoremPixel.image(is_gray: ...)` instead.', uplevel: 1
          is_gray = legacy_is_gray
        end
        if legacy_category != NOT_GIVEN
          warn_with_uplevel 'Passing `category` with the 3rd argument of `LoremPixel.image` is deprecated. Use keyword argument like `LoremPixel.image(category: ...)` instead.', uplevel: 1
          category = legacy_category
        end
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 4th argument of `LoremPixel.image` is deprecated. Use keyword argument like `LoremPixel.image(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_text != NOT_GIVEN
          warn_with_uplevel 'Passing `text` with the 5th argument of `LoremPixel.image` is deprecated. Use keyword argument like `LoremPixel.image(text: ...)` instead.', uplevel: 1
          text = legacy_text
        end
        if legacy_secure != NOT_GIVEN
          warn_with_uplevel 'Passing `secure` with the 6th argument of `LoremPixel.image` is deprecated. Use keyword argument like `LoremPixel.image(secure: ...)` instead.', uplevel: 1
          secure = legacy_secure
        end

        raise ArgumentError, 'Size should be specified in format 300x300' unless size =~ /^[0-9]+x[0-9]+$/
        raise ArgumentError, "Supported categories are #{SUPPORTED_CATEGORIES.join(', ')}" unless category.nil? || SUPPORTED_CATEGORIES.include?(category)
        raise ArgumentError, 'Category required when number is passed' if !number.nil? && category.nil?
        raise ArgumentError, 'Number must be between 1 and 10' unless number.nil? || (1..10).cover?(number)
        raise ArgumentError, 'Category and number must be passed when text is passed' if !text.nil? && number.nil? && category.nil?

        url_parts = secure ? ['https:/'] : ['http:/']
        url_parts << ['lorempixel.com']
        url_parts << 'g' if is_gray
        url_parts += size.split('x')
        url_parts += [category, number, text].compact
        url_parts.join('/')
      end
      # rubocop:enable Metrics/ParameterLists
    end
  end
end
