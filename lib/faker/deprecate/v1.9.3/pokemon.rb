# frozen_string_literal: true

module Faker
  class Pokemon
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

      deprecate :name, 'Faker::Games::Pokemon.name', 2019, 01
      deprecate :location, 'Faker::Games::Pokemon.location', 2019, 01
      deprecate :move, 'Faker::Games::Pokemon.move', 2019, 01
    end
  end
end
