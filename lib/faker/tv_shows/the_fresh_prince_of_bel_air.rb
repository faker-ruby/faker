# frozen_string_literal: true

module Faker
  class TvShows
    class TheFreshPrinceOfBelAir < Base
      flexible :the_fresh_prince_of_bel_air

      class << self
        ##
        # Produces a character from The Fresh Prince of Bel-Air.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::TheFreshPrinceOfBelAir.character #=> "Will Smith"
        #
        # @faker.version 1.8.3
        def character
          fetch('the_fresh_prince_of_bel_air.characters')
        end

        ##
        # Produces a celebrity from The Fresh Prince of Bel-Air.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::TheFreshPrinceOfBelAir.celebrity #=> "Quincy Jones"
        #
        # @faker.version 1.8.3
        def celebrity
          fetch('the_fresh_prince_of_bel_air.celebrities')
        end

        ##
        # Produces a quote from The Fresh Prince of Bel-Air.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::TheFreshPrinceOfBelAir.quote
        #     #=> "Girl, you look so good, I would marry your brother just to get in your family."
        #
        # @faker.version 1.8.3
        def quote
          fetch('the_fresh_prince_of_bel_air.quotes')
        end
      end
    end
  end
end
