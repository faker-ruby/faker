# frozen_string_literal: true

module Faker
  module Zelda
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

      deprecate :game, 'Faker::Games::Zelda.game', 2019, 0o1
      deprecate :character, 'Faker::Games::Zelda.character', 2019, 0o1
      deprecate :location, 'Faker::Games::Zelda.location', 2019, 0o1
      deprecate :item, 'Faker::Games::Zelda.item', 2019, 0o1
    end
  end
end
