# frozen_string_literal: true

module Faker
  class HeyArnold < Base
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

      deprecate :character, 'Faker::TvShows::HeyArnold.character', 2018, 10
      deprecate :location, 'Faker::TvShows::HeyArnold.location', 2018, 10
      deprecate :quote, 'Faker::TvShows::HeyArnold.quote', 2018, 10
    end
  end
end
