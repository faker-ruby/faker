# frozen_string_literal: true

module Faker
  module Cat
    class << self
      extend Gem::Deprecate

      def name
        Faker::Creature::Cat.name
      end

      def breed
        Faker::Creature::Cat.breed
      end

      def registry
        Faker::Creature::Cat.registry
      end

      deprecate :name, 'Faker::Creature::Cat.name', 2018, 10
      deprecate :breed, 'Faker::Creature::Cat.breed', 2018, 10
      deprecate :registry, 'Faker::Creature::Cat.registry', 2018, 10
    end
  end
end
