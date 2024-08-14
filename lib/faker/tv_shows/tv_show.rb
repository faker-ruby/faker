# frozen_string_literal: true

module Faker
  class TvShow < Base
    class << self
      ##
      # Produces a title from a tv show.
      #
      # @return [String]
      #
      # @example
      #   Faker::TvShow.title #=> "Game of Thrones"
      #
      # @faker.version 3.4.2
      def title
        fetch('tv_show.titles')
      end

      ##
      # Produces a quote from a tv show.
      #
      # @return [String]
      #
      # @example
      #   Faker::TvShow.quote #=> "When you play the game of thrones, you win or you die. There is no middle ground."
      #
      # @faker.version 3.4.2
      def quote
        fetch('tv_show.quotes')
      end
    end
  end
end
