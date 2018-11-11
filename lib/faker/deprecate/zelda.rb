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

      deprecate :game, 'Faker::Games::Zelda.game', 2018, 10
      deprecate :character, 'Faker::Games::Zelda.character', 2018, 10
      deprecate :location, 'Faker::Games::Zelda.location', 2018, 10
      deprecate :item, 'Faker::Games::Zelda.item', 2018, 10
    end
  end
end
