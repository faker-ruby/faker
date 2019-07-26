# frozen_string_literal: true

module Faker
  class Games
    class SonicTheHedgehog < Base
      class << self
        def character
          fetch('games.sonic_the_hedgehog.character')
        end

        def zone
          fetch('games.sonic_the_hedgehog.zone')
        end

        def game
          fetch('games.sonic_the_hedgehog.game')
        end
      end
    end
  end
end
