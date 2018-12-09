# frozen_string_literal: true

module Faker
  class VentureBros < Base
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

      deprecate :character, 'Faker::TvShows::VentureBros.character', 2018, 12
      deprecate :organization, 'Faker::TvShows::VentureBros.organization', 2018, 12
      deprecate :vehicle, 'Faker::TvShows::VentureBros.vehicle', 2018, 12
      deprecate :quote, 'Faker::TvShows::VentureBros.quote', 2018, 12
    end
  end
end
