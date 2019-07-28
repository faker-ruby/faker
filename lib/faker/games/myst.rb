# frozen_string_literal: true

module Faker
  class Games
    class Myst < Base
      class << self
        def game
          fetch('games.myst.games')
        end

        def creature
          fetch('games.myst.creatures')
        end

        def age
          fetch('games.myst.ages')
        end

        def character
          fetch('games.myst.characters')
        end

        def quote
          fetch('games.myst.quotes')
        end
      end
    end
  end
end
