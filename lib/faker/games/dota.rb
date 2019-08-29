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

        def quote(legacy_hero = NOT_GIVEN, hero: 'abaddon')
          if legacy_hero != NOT_GIVEN
            warn_with_uplevel 'Passing `hero` with the 1st argument of `Dota.quote` is deprecated. Use keyword argument like `Dota.quote(hero: ...)` instead.', uplevel: 1
            hero = legacy_hero
          end

          fetch("games.dota.#{hero}.quote")
        end
      end
    end
  end
end
