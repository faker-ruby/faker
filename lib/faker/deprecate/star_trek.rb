# frozen_string_literal: true

module Faker
  class StarTrek
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::StarTrek.character
      end

      def location
        Faker::TvShows::StarTrek.location
      end

      def specie
        Faker::TvShows::StarTrek.specie
      end

      def villain
        Faker::TvShows::StarTrek.villain
      end

      deprecate :character, 'Faker::TvShows::StarTrek.character', 2019, 01
      deprecate :location, 'Faker::TvShows::StarTrek.location', 2019, 01
      deprecate :specie, 'Faker::TvShows::StarTrek.specie', 2019, 01
      deprecate :villain, 'Faker::TvShows::StarTrek.villain', 2019, 01
    end
  end
end
