# frozen_string_literal: true

module Faker
  class TwinPeaks < Base
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

      deprecate :character, 'Faker::TvShows::TwinPeaks.character', 2018, 10
      deprecate :location, 'Faker::TvShows::TwinPeaks.location', 2018, 10
      deprecate :quote, 'Faker::TvShows::TwinPeaks.quote', 2018, 10
    end
  end
end
