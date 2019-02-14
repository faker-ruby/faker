# frozen_string_literal: true

module Faker
  class Stargate
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::Stargate.character
      end

      def planet
        Faker::TvShows::Stargate.planet
      end

      def quote
        Faker::TvShows::Stargate.quote
      end

      deprecate :character, 'Faker::TvShows::Stargate.character', 2019, 01
      deprecate :planet, 'Faker::TvShows::Stargate.planet', 2019, 01
      deprecate :quote, 'Faker::TvShows::Stargate.quote', 2019, 01
    end
  end
end
