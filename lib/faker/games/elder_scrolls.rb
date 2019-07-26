# frozen_string_literal: true

module Faker
  class Games
    class ElderScrolls < Base
      class << self
        def race
          fetch('games.elder_scrolls.race')
        end

        def city
          fetch('games.elder_scrolls.city')
        end

        def creature
          fetch('games.elder_scrolls.creature')
        end

        def region
          fetch('games.elder_scrolls.region')
        end

        def dragon
          fetch('games.elder_scrolls.dragon')
        end

        def name
          "#{fetch('games.elder_scrolls.first_name')} #{fetch('games.elder_scrolls.last_name')}"
        end

        def first_name
          fetch('games.elder_scrolls.first_name')
        end

        def last_name
          fetch('games.elder_scrolls.last_name')
        end
      end
    end
  end
end
