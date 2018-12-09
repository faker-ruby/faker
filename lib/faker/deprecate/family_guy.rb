# frozen_string_literal: true

module Faker
  class FamilyGuy < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::FamilyGuy.character
      end

      def location
        Faker::TvShows::FamilyGuy.location
      end

      def quote
        Faker::TvShows::FamilyGuy.quote
      end

      deprecate :character, 'Faker::TvShows::FamilyGuy.character', 2018, 12
      deprecate :location, 'Faker::TvShows::FamilyGuy.location', 2018, 12
      deprecate :quote, 'Faker::TvShows::FamilyGuy.quote', 2018, 12
    end
  end
end
