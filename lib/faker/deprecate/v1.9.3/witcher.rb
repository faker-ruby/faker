# frozen_string_literal: true

module Faker
  class Witcher
    class << self
      extend Gem::Deprecate

      def character
        Faker::Games::Witcher.character
      end

      def witcher
        Faker::Games::Witcher.witcher
      end

      def school
        Faker::Games::Witcher.school
      end

      def location
        Faker::Games::Witcher.location
      end

      def quote
        Faker::Games::Witcher.quote
      end

      def monster
        Faker::Games::Witcher.monster
      end

      deprecate :character, 'Faker::Games::Witcher.character', 2018, 10
      deprecate :witcher, 'Faker::Games::Witcher.witcher', 2018, 10
      deprecate :school, 'Faker::Games::Witcher.school', 2018, 10
      deprecate :location, 'Faker::Games::Witcher.location', 2018, 10
      deprecate :quote, 'Faker::Games::Witcher.quote', 2018, 10
      deprecate :monster, 'Faker::Games::Witcher.monster', 2018, 10
    end
  end
end
