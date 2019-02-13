# frozen_string_literal: true

module Faker
  class LordOfTheRings
    class << self
      extend Gem::Deprecate

      def character
        Faker::Movies::LordOfTheRings.character
      end

      def location
        Faker::Movies::LordOfTheRings.location
      end

      def quote
        Faker::Movies::LordOfTheRings.quote
      end

      deprecate :character, 'Faker::Movies::LordOfTheRings.character', 2019, 01
      deprecate :location, 'Faker::Movies::LordOfTheRings.location', 2019, 01
      deprecate :quote, 'Faker::Movies::LordOfTheRings.quote', 2019, 01
    end
  end
end
