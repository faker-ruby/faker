# frozen_string_literal: true

module Faker
  class RickAndMorty
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::RickAndMorty.character
      end

      def location
        Faker::TvShows::RickAndMorty.location
      end

      def quote
        Faker::TvShows::RickAndMorty.quote
      end

      deprecate :character, 'Faker::TvShows::RickAndMorty.character', 2019, 01
      deprecate :location, 'Faker::TvShows::RickAndMorty.location', 2019, 01
      deprecate :quote, 'Faker::TvShows::RickAndMorty.quote', 2019, 01
    end
  end
end
