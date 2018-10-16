# frozen_string_literal: true

module Faker
  module Games
    class Zelda < Base
      flexible :space
      class << self
        def game
          fetch('games.zelda.games')
        end

        def character
          fetch('games.zelda.characters')
        end

        def location
          fetch('games.zelda.locations')
        end

        def item
          fetch('games.zelda.items')
        end
      end
    end
  end
end
