# frozen_string_literal: true

module Faker
  class GameOfThrones < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::GameOfThrones.character
      end

      def house
        Faker::TvShows::GameOfThrones.house
      end

      def city
        Faker::TvShows::GameOfThrones.city
      end

      def quote
        Faker::TvShows::GameOfThrones.quote
      end

      def dragon
        Faker::TvShows::GameOfThrones.dragon
      end

      deprecate :character, 'Faker::TvShows::GameOfThrones.character', 2018, 10
      deprecate :house, 'Faker::TvShows::GameOfThrones.house', 2018, 10
      deprecate :city, 'Faker::TvShows::GameOfThrones.city', 2018, 10
      deprecate :quote, 'Faker::TvShows::GameOfThrones.quote', 2018, 10
      deprecate :dragon, 'Faker::TvShows::GameOfThrones.dragon', 2018, 10
    end
  end
end
