# frozen_string_literal: true

module Faker
  module Myst
    class << self
      extend Gem::Deprecate

      def game
        Faker::Games::Myst.game
      end

      def creature
        Faker::Games::Myst.creature
      end

      def age
        Faker::Games::Myst.age
      end

      def character
        Faker::Games::Myst.character
      end

      def quote
        Faker::Games::Myst.quote
      end

      deprecate :game, 'Faker::Games::Myst.game', 2018, 10
      deprecate :creature, 'Faker::Games::Myst.creature', 2018, 10
      deprecate :age, 'Faker::Games::Myst.age', 2018, 10
      deprecate :character, 'Faker::Games::Myst.character', 2018, 10
      deprecate :quote, 'Faker::Games::Myst.quote', 2018, 10
    end
  end
end
