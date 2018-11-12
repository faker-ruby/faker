# frozen_string_literal: true

module Faker
  class Lebowski < Base
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

      deprecate :actor, 'Faker::Movies::Lebowski.actor', 2018, 12
      deprecate :character, 'Faker::Movies::Lebowski.character', 2018, 12
      deprecate :quote, 'Faker::Movies::Lebowski.quote', 2018, 12
    end
  end
end
