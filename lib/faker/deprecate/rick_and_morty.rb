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

      deprecate :character, 'Faker::TvShows::RickAndMorty.character', 2018, 12
      deprecate :location, 'Faker::TvShows::RickAndMorty.location', 2018, 12
      deprecate :quote, 'Faker::TvShows::RickAndMorty.quote', 2018, 12
    end
  end
end
