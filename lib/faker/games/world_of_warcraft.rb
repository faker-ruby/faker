# frozen_string_literal: true

module Faker
  module Games
    class WorldOfWarcraft < Base
      class << self
        def hero
          fetch('games.world_of_warcraft.hero')
        end

        def quote
          fetch('games.world_of_warcraft.quotes')
        end
      end
    end
  end
end
