# frozen_string_literal: true

module Faker
  class Movie < Base
    class << self
      ##
      # Produces a title from a movie.
      #
      # @return [String]
      #
      # @example
      #   Faker::Movie.title #=> "The Lord of the Rings: The Two Towers"
      #
      # @faker.version 2.13.0
      def title
        fetch('movie.title')
      end

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

      ##
      # Produces a director for a movie.
      #
      # @return [String]
      #
      # @example
      #   Faker::Movie.director #=> "Quentin Tarantino"
      #
      # @faker.version next
      def director
        fetch('movie.director')
      end
    end
  end
end
