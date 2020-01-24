# frozen_string_literal: true

module Faker
  class Games
    class WarhammerFantasy < Base
      class << self
        def hero
          fetch('games.warhammer_fantasy.hero')
        end

        def quote
          fetch('games.warhammer_fantasy.quotes')
        end

        def faction
          fetch('games.warhammer_fantasy.factions')
        end
        # creature
        def location
          fetch('games.warhammer_fantasy.locations')
        end
      end
    end
  end
end
