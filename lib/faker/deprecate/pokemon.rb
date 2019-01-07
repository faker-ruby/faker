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

      deprecate :name, 'Faker::Games::Pokemon.name', 2019, 0o1
      deprecate :location, 'Faker::Games::Pokemon.location', 2019, 0o1
      deprecate :move, 'Faker::Games::Pokemon.move', 2019, 0o1
    end
  end
end
