module Faker
  class LoremFlickr < Base
    class << self
      def image(size = '300x300', is_gray = false, search_terms = [], match_all = false)
        raise ArgumentError, 'Size should be specified in format 300x300' unless size.match(/^[0-9]+x[0-9]+$/)

        url_parts = ['http://loremflickr.com']
        url_parts << 'g' if is_gray
        url_parts += size.split('x')
        url_parts << search_terms.compact.join(',') if search_terms.any?
        url_parts << 'all' if match_all
        url_parts.join('/')
      end
    end
  end
end
