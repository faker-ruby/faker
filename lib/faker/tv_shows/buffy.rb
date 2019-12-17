# frozen_string_literal: true

module Faker
  class TvShows
    class Buffy < Base
      flexible :buffy

      class << self
        ##
        # Produces a character from Buffy the Vampire Slayer.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::Buffy.character #=> "Buffy Summers"
        #
        # @faker.version 1.9.2
        def character
          fetch('buffy.characters')
        end

        ##
        # Produces a quote from Buffy the Vampire Slayer.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::Buffy.quote #=> "If the apocalypse comes, beep me."
        #
        # @faker.version 1.9.2
        def quote
          fetch('buffy.quotes')
        end

        ##
        # Produces a celebrity from Buffy the Vampire Slayer.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::Buffy.celebrity #=> "John Ritter"
        #
        # @faker.version 1.9.2
        def celebrity
          fetch('buffy.celebrities')
        end

        ##
        # Produces a big bad from Buffy the Vampire Slayer.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::Buffy.big_bad #=> "Glory"
        #
        # @faker.version 1.9.2
        def big_bad
          fetch('buffy.big_bads')
        end

        ##
        # Produces an episode from Buffy the Vampire Slayer.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::Buffy.episode #=> "Once More, with Feeling"
        #
        # @faker.version 1.9.2
        def episode
          fetch('buffy.episodes')
        end
      end
    end
  end
end
