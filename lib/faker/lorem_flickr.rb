# frozen_string_literal: true

module Faker
  module LoremFlickr
    class << self
      extend Gem::Deprecate

      def image(size = '300x300', search_terms = [], match_all = false)
        Faker::Lorem::Flickr.image(size, search_terms, match_all)
      end

      def grayscale_image(size = '300x300', search_terms = ['all'], match_all = false)
        Faker::Lorem::Flickr.grayscale_image(size, search_terms, match_all)
      end

      def pixelated_image(size = '300x300', search_terms = ['all'], match_all = false)
        Faker::Lorem::Flickr.pixelated_image(size, search_terms, match_all)
      end

      def colorized_image(size = '300x300', color = 'red', search_terms = ['all'], match_all = false)
        Faker::Lorem::Flickr.colorized_image(size, color, search_terms, match_all)
      end

      private

      def build_url(size, format, search_terms, match_all)
        raise ArgumentError, 'Size should be specified in format 300x300' unless size =~ /^[0-9]+x[0-9]+$/

        url_parts = ['http://loremflickr.com']
        url_parts << format
        url_parts += size.split('x')
        url_parts << search_terms.compact.join(',') if search_terms.any?
        url_parts << 'all' if match_all
        url_parts.compact.join('/')
      end

      deprecate :image, 'Faker::Lorem::Flickr.image', 2018, 10
      deprecate :grayscale_image, 'Faker::Lorem::Flickr.grayscale_image', 2018, 10
      deprecate :pixelated_image, 'Faker::Lorem::Flickr.pixelated_image', 2018, 10
      deprecate :colorized_image, 'Faker::Lorem::Flickr.colorized_image', 2018, 10
    end
  end
end
