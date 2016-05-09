module Faker
  class Placeholdit < Base
    class << self
      SUPPORTED_FORMATS = %w(png jpg gif jpeg)

      def image(size = '300x300', format = 'png', background_color = '000', text_color = nil, text = nil)
        raise ArgumentError, "Size should be specified in format 300x300" unless size.match(/^[0-9]+x[0-9]+$/)
        raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}" unless SUPPORTED_FORMATS.include?(format)
        raise ArgumentError, "background_color must be a hex value without '#'" unless background_color.match(/((?:^\h{3}$)|(?:^\h{6}$)){1}(?!.*\H)/)
        raise ArgumentError, "text_color must be a hex value without '#'" unless text_color.nil? || text_color.match(/((?:^\h{3}$)|(?:^\h{6}$)){1}(?!.*\H)/)

        image_url = "https://placehold.it/#{size}.#{format}"
        image_url += "/#{background_color}"
        image_url += "/#{text_color}" if text_color
        image_url += "?text=#{text}" if text
        image_url
      end
    end
  end
end
