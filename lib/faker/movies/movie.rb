# frozen_string_literal: true

module Faker
  class Movie < Base
    class << self
      ##
      # Produces a quote from a movie.
      #
      # @return [String]
      #
      # @example
      #   Faker::Movie.quote #=> "Bumble bee tuna"
      #
      # @faker.version 1.8.1
      def quote
        fetch('movie.quote')
      end
    end
  end
end
