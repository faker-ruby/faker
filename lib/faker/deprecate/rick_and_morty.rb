# frozen_string_literal: true

module Faker
  class RickAndMorty < Base
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

      deprecate :character, 'Faker::TvShows::RickAndMorty.character', 2019, 0o1
      deprecate :location, 'Faker::TvShows::RickAndMorty.location', 2019, 0o1
      deprecate :quote, 'Faker::TvShows::RickAndMorty.quote', 2019, 0o1
    end
  end
end
