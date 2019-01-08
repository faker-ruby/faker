# frozen_string_literal: true

module Faker
  class BojackHorseman
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::BojackHorseman.character
      end

      def tongue_twister
        Faker::TvShows::BojackHorseman.tongue_twister
      end

      def quote
        Faker::TvShows::BojackHorseman.quote
      end

      deprecate :character, 'Faker::TvShows::BojackHorseman.character', 2019, 01
      deprecate :tongue_twister, 'Faker::TvShows::BojackHorseman.tongue_twister', 2019, 01
      deprecate :quote, 'Faker::TvShows::BojackHorseman.quote', 2019, 01
    end
  end
end
