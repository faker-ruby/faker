# frozen_string_literal: true

module Faker
  class WorldOfWarcraft
    class << self
      extend Gem::Deprecate

      def hero
        Faker::Games::WorldOfWarcraft.hero
      end

      def quote
        Faker::Games::WorldOfWarcraft.quote
      end

      deprecate :hero, 'Faker::Games::WorldOfWarcraft.hero', 2019, 01
      deprecate :quote, 'Faker::Games::WorldOfWarcraft.quote', 2019, 01
    end
  end
end
