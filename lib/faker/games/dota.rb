# frozen_string_literal: true

module Faker
  class Games
    class Dota < Base
      class << self
        def hero
          fetch('games.dota.hero')
        end

        def item
          fetch('games.dota.item')
        end

        def team
          fetch('games.dota.team')
        end

        def player
          fetch('games.dota.player')
        end

        def quote(hero: 'abaddon')
          fetch("games.dota.#{hero}.quote")
        end
      end
    end
  end
end
