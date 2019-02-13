# frozen_string_literal: true

module Faker
  class Cat
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

      deprecate :name, 'Faker::Creature::Cat.name', 2019, 01
      deprecate :breed, 'Faker::Creature::Cat.breed', 2019, 01
      deprecate :registry, 'Faker::Creature::Cat.registry', 2019, 01
    end
  end
end
