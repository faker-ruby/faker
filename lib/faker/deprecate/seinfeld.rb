# frozen_string_literal: true

module Faker
  class Seinfeld
    class << self
      extend Gem::Deprecate

      def business
        Faker::TvShows::Seinfeld.business
      end

      def character
        Faker::TvShows::Seinfeld.character
      end

      def quote
        Faker::TvShows::Seinfeld.quote
      end

      deprecate :business, 'Faker::TvShows::Seinfeld.business', 2019, 01
      deprecate :character, 'Faker::TvShows::Seinfeld.character', 2019, 01
      deprecate :quote, 'Faker::TvShows::Seinfeld.quote', 2019, 01
    end
  end
end
