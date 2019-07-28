# frozen_string_literal: true

module Faker
  class Games
    class Witcher < Base
      class << self
        def character
          fetch('games.witcher.characters')
        end

        def witcher
          fetch('games.witcher.witchers')
        end

        def school
          fetch('games.witcher.schools')
        end

        def location
          fetch('games.witcher.locations')
        end

        def quote
          fetch('games.witcher.quotes')
        end

        def monster
          fetch('games.witcher.monsters')
        end
      end
    end
  end
end
