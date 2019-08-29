# frozen_string_literal: true

module Faker
  class Games
    class HalfLife < Base
      class << self
        def character
          fetch('games.half_life.character')
        end

        def enemy
          fetch('games.half_life.enemy')
        end

        def location
          fetch('games.half_life.location')
        end
      end
    end
  end
end
