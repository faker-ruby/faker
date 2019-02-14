# frozen_string_literal: true

module Faker
  class Overwatch
    class << self
      extend Gem::Deprecate

      def hero
        Faker::Games::Overwatch.hero
      end

      def location
        Faker::Games::Overwatch.location
      end

      def quote
        Faker::Games::Overwatch.quote
      end

      deprecate :hero, 'Faker::Games::Overwatch.hero', 2019, 01
      deprecate :location, 'Faker::Games::Overwatch.location', 2019, 01
      deprecate :quote, 'Faker::Games::Overwatch.quote', 2019, 01
    end
  end
end
