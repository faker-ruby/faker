# frozen_string_literal: true

module Faker
  class Games
    class WorldOfWarcraft < Base
      class << self
        ##
        # Produces the name of a hero from World of Warcraft.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::WorldOfWarcraft.hero #=> "Uther the Lightbringer"
        #
        # @faker.version 1.9.2
        def hero
          fetch('games.world_of_warcraft.hero')
        end

        ##
        # Produces a quote from World of Warcraft.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::WorldOfWarcraft.quote #=> "These are dark times indeed."
        #
        # @faker.version 1.9.2
        def quote
          fetch('games.world_of_warcraft.quotes')
        end
      end
    end
  end
end
