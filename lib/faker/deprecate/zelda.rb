# frozen_string_literal: true

module Faker
  class Zelda
    class << self
      extend Gem::Deprecate

      def game
        Faker::Games::Zelda.game
      end

      def character
        Faker::Games::Zelda.character
      end

      def location
        Faker::Games::Zelda.location
      end

      def item
        Faker::Games::Zelda.item
      end

      deprecate :game, 'Faker::Games::Zelda.game', 2019, 01
      deprecate :character, 'Faker::Games::Zelda.character', 2019, 01
      deprecate :location, 'Faker::Games::Zelda.location', 2019, 01
      deprecate :item, 'Faker::Games::Zelda.item', 2019, 01
    end
  end
end
