# frozen_string_literal: true

module Faker
  class TwinPeaks
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::TwinPeaks.character
      end

      def location
        Faker::TvShows::TwinPeaks.location
      end

      def quote
        Faker::TvShows::TwinPeaks.quote
      end

      deprecate :character, 'Faker::TvShows::TwinPeaks.character', 2019, 01
      deprecate :location, 'Faker::TvShows::TwinPeaks.location', 2019, 01
      deprecate :quote, 'Faker::TvShows::TwinPeaks.quote', 2019, 01
    end
  end
end
