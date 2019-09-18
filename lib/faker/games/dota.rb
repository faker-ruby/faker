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
          warn_for_deprecated_arguments do |keywords|
            keywords << :hero if legacy_hero != NOT_GIVEN
          end

          fetch("games.dota.#{hero}.quote")
        end
      end
    end
  end
end
