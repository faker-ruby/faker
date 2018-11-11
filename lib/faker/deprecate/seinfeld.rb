# frozen_string_literal: true

module Faker
  class Seinfeld < Base
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

      deprecate :business, 'Faker::TvShows::Seinfeld.business', 2018, 12
      deprecate :character, 'Faker::TvShows::Seinfeld.character', 2018, 12
      deprecate :quote, 'Faker::TvShows::Seinfeld.quote', 2018, 12
    end
  end
end
