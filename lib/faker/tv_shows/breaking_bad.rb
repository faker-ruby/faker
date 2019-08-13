# frozen_string_literal: true

module Faker
  class TvShows
    class BreakingBad < Base
      flexible :breaking_bad

      class << self
        ##
        # Produces the name of a character from Breaking Bad.
        #
        # @return [String]
        #
        # @example Faker::TvShows::BreakingBad.character
        #   "Walter White"
        def character
          fetch('breaking_bad.character')
        end

        ##
        # Produces the name of an episode from Breaking Bad.
        #
        # @return [String]
        #
        # @example Faker::TvShows::BreakingBad.episode
        #   "Fly"
        def episode
          fetch('breaking_bad.episode')
        end
      end
    end
  end
end
