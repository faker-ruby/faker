# frozen_string_literal: true

module Faker
  class ParksAndRec < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::ParksAndRec.character
      end

      def city
        Faker::TvShows::ParksAndRec.city
      end

      deprecate :character, 'Faker::TvShows::ParksAndRec.character', 2018, 12
      deprecate :city, 'Faker::TvShows::ParksAndRec.city', 2018, 12
    end
  end
end
