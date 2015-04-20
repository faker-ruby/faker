module Faker
  class Placeholdit < Base
    class << self
      SUPPORTED_FORMATS = %w(png jpg bmp jpeg)

      def image(slug = nil, size = '300x300', format = 'png', color = nil, )
        raise ArgumentError, "Size should be specified in format 300x300" unless size.match(/^[0-9]+x[0-9]+$/)
        raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}" unless SUPPORTED_FORMATS.include?(format)
        image_url = "http://placehold.it/#{size}.#{format}"
        image_url += "/#{color}" if color
        image_url += "&text=#{slug}" if slug
        image_url
      end
    end
  end
end
