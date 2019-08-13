# frozen_string_literal: true

module Faker
  class Games
    class Zelda < Base
      flexible :space
      class << self
        ##
        # Produces the name of a Legend of Zelda game.
        #
        # @return [String]
        #
        # @example Faker::Games::Zelda.game
        #   "Breath of the Wild"
        def game
          fetch('games.zelda.games')
        end

        ##
        # Produces the name of a character from the Legend of Zelda games.
        #
        # @return [String]
        #
        # @example Faker::Games::Zelda.character
        #   "Link"
        def character
          fetch('games.zelda.characters')
        end

        ##
        # Produces the name of a character from the Legend of Zelda games.
        #
        # @return [String]
        #
        # @example Faker::Games::Zelda.location
        #   "Hyrule Castle"
        def location
          fetch('games.zelda.locations')
        end

        ##
        # Produces the name of an item from the Legend of Zelda games.
        #
        # @return [String]
        #
        # @example Faker::Games::Zelda.item
        #   "Boomerang"
        def item
          fetch('games.zelda.items')
        end
      end
    end
  end
end
