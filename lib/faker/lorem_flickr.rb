module Faker
  class LoremFlickr < Base
    class << self
      def image(size = '300x300', is_gray = false, search_terms = [], match_all = false)
        format = 'g' if is_gray
        build_url(size, format, search_terms, match_all)
      end

      def pixelated_image(size = '300x300', search_terms = [], match_all = false)
        raise ArgumentError, 'Search terms must be specified for pixelated images' unless search_terms.any?

        build_url(size, 'p', search_terms, match_all)
      end

      private

      def build_url(size, format, search_terms, match_all)
        raise ArgumentError, 'Size should be specified in format 300x300' unless size.match(/^[0-9]+x[0-9]+$/)

        url_parts = ['http://loremflickr.com']
        url_parts << format
        url_parts += size.split('x')
        url_parts << search_terms.compact.join(',') if search_terms.any?
        url_parts << 'all' if match_all
        url_parts.compact.join('/')
      end
    end
  end
end
