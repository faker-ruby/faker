module Faker
  class MovieQuotes < Base
    class << self
      def quote
        fetch('movie_quotes.quote')
      end
    end
  end
end
