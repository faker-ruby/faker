# frozen_string_literal: true

module Faker
  module Games
    class MagicTheGathering < Base
      class << self
        def name
          fetch('games.magic_the_gathering.names')
        end

        def color
          fetch('games.magic_the_gathering.colors')
        end

        def rarity
          fetch('games.magic_the_gathering.rarities')
        end

        def type
          fetch('games.magic_the_gathering.types')
        end
      end
    end
  end
end
