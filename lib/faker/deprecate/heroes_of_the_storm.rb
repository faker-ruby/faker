# frozen_string_literal: true

module Faker
  class HeroesOfTheStorm
    class << self
      extend Gem::Deprecate

      def battleground
        Faker::Games::HeroesOfTheStorm.battleground
      end

      def class
        Faker::Games::HeroesOfTheStorm.class
      end

      def hero
        Faker::Games::HeroesOfTheStorm.hero
      end

      def quote
        Faker::Games::HeroesOfTheStorm.quote
      end

      deprecate :battleground, 'Faker::Games::HeroesOfTheStorm.battleground', 2019, 01
      deprecate :class, 'Faker::Games::HeroesOfTheStorm.class', 2019, 01
      deprecate :hero, 'Faker::Games::HeroesOfTheStorm.hero', 2019, 01
      deprecate :quote, 'Faker::Games::HeroesOfTheStorm.quote', 2019, 01
    end
  end
end
