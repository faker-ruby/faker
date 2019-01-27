# frozen_string_literal: true

module Faker
  class Fallout
    class << self
      extend Gem::Deprecate

      def character
        Faker::Games::Fallout.character
      end

      def faction
        Faker::Games::Fallout.faction
      end

      def location
        Faker::Games::Fallout.location
      end

      def quote
        Faker::Games::Fallout.quote
      end

      deprecate :character, 'Faker::Games::Fallout.character', 2019, 01
      deprecate :faction, 'Faker::Games::Fallout.faction', 2019, 01
      deprecate :location, 'Faker::Games::Fallout.location', 2019, 01
      deprecate :quote, 'Faker::Games::Fallout.quote', 2019, 01
    end
  end
end
