# frozen_string_literal: true

module Faker
  class Simpsons
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::Simpsons.character
      end

      def location
        Faker::TvShows::Simpsons.location
      end

      def quote
        Faker::TvShows::Simpsons.quote
      end

      deprecate :character, 'Faker::TvShows::Simpsons.character', 2019, 01
      deprecate :location, 'Faker::TvShows::Simpsons.location', 2019, 01
      deprecate :quote, 'Faker::TvShows::Simpsons.quote', 2019, 01
    end
  end
end
