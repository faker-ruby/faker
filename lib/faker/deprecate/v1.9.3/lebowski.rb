# frozen_string_literal: true

module Faker
  class Lebowski
    class << self
      extend Gem::Deprecate

      def actor
        Faker::Movies::Lebowski.actor
      end

      def character
        Faker::Movies::Lebowski.character
      end

      def quote
        Faker::Movies::Lebowski.quote
      end

      deprecate :actor, 'Faker::Movies::Lebowski.actor', 2019, 01
      deprecate :character, 'Faker::Movies::Lebowski.character', 2019, 01
      deprecate :quote, 'Faker::Movies::Lebowski.quote', 2019, 01
    end
  end
end
