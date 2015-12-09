require 'google-search'

module Faker
  class Image < Base
    class << self

      def urls(search_query, number)
        Google::Search::Image.new(:query => search_query).all.slice(0,number).map do |x|
          x.uri
        end
      end
    end
  end
end
