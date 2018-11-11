# frozen_string_literal: true

module Faker
  class Simpsons < Base
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

      deprecate :character, 'Faker::TvShows::Simpsons.character', 2018, 10
      deprecate :location, 'Faker::TvShows::Simpsons.location', 2018, 10
      deprecate :quote, 'Faker::TvShows::Simpsons.quote', 2018, 10
    end
  end
end
