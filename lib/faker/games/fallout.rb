# frozen_string_literal: true

module Faker
  module Games
    class Fallout < Base
      class << self
        def character
          fetch('games.fallout.characters')
        end

        def faction
          fetch('games.fallout.factions')
        end

        def location
          fetch('games.fallout.locations')
        end

        def quote
          fetch('games.fallout.quotes')
        end
      end
    end
  end
end
