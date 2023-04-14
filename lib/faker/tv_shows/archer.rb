# frozen_string_literal: true

module Faker
  class TvShows
    class Archer < Base
      flexible :archer

      class << self
        ##
        # Produces a character from Archer.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::Archer.character #=> "Sterling Archer"
        #
        # @faker.version 2.13.0
        def character
          fetch('archer.characters')
        end

        ##
        # Produces a location from Archer.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::Archer.location #=> "The Tuntmore Towers"
        #
        # @faker.version 2.13.0
        def location
          fetch('archer.locations')
        end

        ##
        # Produces a quote from Archer.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::Archer.quote
        #     #=> "You're not my supervisor!"
        #
        # @faker.version 2.13.0
        def quote
          fetch('archer.quotes')
        end
      end
    end
  end
end
