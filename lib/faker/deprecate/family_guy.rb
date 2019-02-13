# frozen_string_literal: true

module Faker
  class FamilyGuy
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

      deprecate :character, 'Faker::TvShows::FamilyGuy.character', 2019, 01
      deprecate :location, 'Faker::TvShows::FamilyGuy.location', 2019, 01
      deprecate :quote, 'Faker::TvShows::FamilyGuy.quote', 2019, 01
    end
  end
end
