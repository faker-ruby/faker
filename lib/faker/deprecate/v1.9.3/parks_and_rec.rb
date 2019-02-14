# frozen_string_literal: true

module Faker
  class ParksAndRec
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::ParksAndRec.character
      end

      def city
        Faker::TvShows::ParksAndRec.city
      end

      deprecate :character, 'Faker::TvShows::ParksAndRec.character', 2019, 01
      deprecate :city, 'Faker::TvShows::ParksAndRec.city', 2019, 01
    end
  end
end
