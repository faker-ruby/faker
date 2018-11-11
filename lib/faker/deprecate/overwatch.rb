# frozen_string_literal: true

module Faker
  module Overwatch
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

      deprecate :hero, 'Faker::Games::Overwatch.hero', 2018, 12
      deprecate :location, 'Faker::Games::Overwatch.location', 2018, 12
      deprecate :quote, 'Faker::Games::Overwatch.quote', 2018, 12
    end
  end
end
