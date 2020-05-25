# frozen_string_literal: true

module Faker
  class TvShows
    class BigBangTheory < Base
      flexible :big_bang_theory

      class << self
        ##
        # Produces a character from Big Bang Theory
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::BigBangTheory.character #=> "Sheldon Cooper"
        #
        # @faker.version next
        def character
          fetch('big_bang_theory.characters')
        end

        ##
        # Produces a quote from Bing Bang Theory
        #
        # @return [String]
        #
        # @example
        # Faker::TvShows::BigBangTheory.quote #=> "I'm not crazy. My mother had me tested."
        #
        # @faker.version next
        def quote
          fetch('big_bang_theory.quotes')
        end
      end
    end
  end
end
