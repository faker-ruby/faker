# frozen_string_literal: true

module Faker
  class Friends
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

      deprecate :character, 'Faker::TvShows::Friends.character', 2019, 01
      deprecate :location, 'Faker::TvShows::Friends.location', 2019, 01
      deprecate :quote, 'Faker::TvShows::Friends.quote', 2019, 01
    end
  end
end
