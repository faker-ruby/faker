# frozen_string_literal: true

module Faker
  class VentureBros
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::VentureBros.character
      end

      def organization
        Faker::TvShows::VentureBros.organization
      end

      def vehicle
        Faker::TvShows::VentureBros.vehicle
      end

      def quote
        Faker::TvShows::VentureBros.quote
      end

      deprecate :character, 'Faker::TvShows::VentureBros.character', 2019, 01
      deprecate :organization, 'Faker::TvShows::VentureBros.organization', 2019, 01
      deprecate :vehicle, 'Faker::TvShows::VentureBros.vehicle', 2019, 01
      deprecate :quote, 'Faker::TvShows::VentureBros.quote', 2019, 01
    end
  end
end
