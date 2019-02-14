# frozen_string_literal: true

module Faker
  class TheThickOfIt
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::TheThickOfIt.character
      end

      def department
        Faker::TvShows::TheThickOfIt.department
      end

      def position
        Faker::TvShows::TheThickOfIt.position
      end

      deprecate :character, 'Faker::TvShows::TheThickOfIt.character', 2019, 01
      deprecate :department, 'Faker::TvShows::TheThickOfIt.department', 2019, 01
      deprecate :position, 'Faker::TvShows::TheThickOfIt.position', 2019, 01
    end
  end
end
