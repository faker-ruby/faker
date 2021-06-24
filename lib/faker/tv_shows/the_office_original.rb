# frozen_string_literal: true

module Faker
  class TvShows
    class TheOfficeOriginal < Base
      flexible :the_office_original

      class << self
        ##
        # Produces a character from The Office (original UK version).
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::TheOfficeOriginal.character #=> "David Brent"
        #
        # @faker.version next
        def character
          fetch('the_office_original.characters')
        end

        ##
        # Produces a quote from The Office (original UK version).
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::TheOfficeOriginal.quote #=> "Unconditional trust. Mutual, likewise, reciprocated."
        #
        # @faker.version next
        def quote
          fetch('the_office_original.quotes')
        end
      end
    end
  end
end
