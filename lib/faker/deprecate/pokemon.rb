# frozen_string_literal: true

module Faker
  module Pokemon
    class << self
      extend Gem::Deprecate

      def name
        Faker::Games::Pokemon.name
      end

      def location
        Faker::Games::Pokemon.location
      end

      def move
        Faker::Games::Pokemon.move
      end

      deprecate :name, 'Faker::Games::Pokemon.name', 2018, 12
      deprecate :location, 'Faker::Games::Pokemon.location', 2018, 12
      deprecate :move, 'Faker::Games::Pokemon.move', 2018, 12
    end
  end
end
