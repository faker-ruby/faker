# frozen_string_literal: true

module Faker
  class Games
    class Pokemon < Base
      class << self
        def name
          fetch('games.pokemon.names')
        end

        def location
          fetch('games.pokemon.locations')
        end

        def move
          fetch('games.pokemon.moves')
        end
      end
    end
  end
end
