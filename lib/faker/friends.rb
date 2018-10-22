# frozen_string_literal: true

module Faker
  class Friends < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::Friends.character
      end

      def location
        Faker::TvShows::Friends.location
      end

      def quote
        Faker::TvShows::Friends.quote
      end

      deprecate :character, 'Faker::TvShows::Friends.character', 2018, 10
      deprecate :location, 'Faker::TvShows::Friends.location', 2018, 10
      deprecate :quote, 'Faker::TvShows::Friends.quote', 2018, 10
    end
  end
end
