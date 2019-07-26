# frozen_string_literal: true

module Faker
  class Games
    class Overwatch < Base
      class << self
        def hero
          fetch('games.overwatch.heroes')
        end

        def location
          fetch('games.overwatch.locations')
        end

        def quote
          fetch('games.overwatch.quotes')
        end
      end
    end
  end
end
