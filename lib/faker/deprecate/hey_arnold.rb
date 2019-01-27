# frozen_string_literal: true

module Faker
  class HeyArnold
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::HeyArnold.character
      end

      def location
        Faker::TvShows::HeyArnold.location
      end

      def quote
        Faker::TvShows::HeyArnold.quote
      end

      deprecate :character, 'Faker::TvShows::HeyArnold.character', 2019, 01
      deprecate :location, 'Faker::TvShows::HeyArnold.location', 2019, 01
      deprecate :quote, 'Faker::TvShows::HeyArnold.quote', 2019, 01
    end
  end
end
