module Faker
  class Avatar < Base
    class << self
      SUPPORTED_FORMATS = %w(png jpg bmp)

      def image(slug = nil, size = '300x300', format = 'png')
        raise ArgumentError, "Size should be specified in format 300x300" unless size.match(/^[0-9]+x[0-9]+$/)
        raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}" unless SUPPORTED_FORMATS.include?(format)
        slug ||= Faker::Lorem.words.join
        "http://robohash.org/#{slug}.#{format}?size=#{size}"
      end
    end
  end
end
