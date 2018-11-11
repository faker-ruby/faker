# frozen_string_literal: true

module Faker
  class TheFreshPrinceOfBelAir < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::TheFreshPrinceOfBelAir.character
      end

      def celebrity
        Faker::TvShows::TheFreshPrinceOfBelAir.celebrity
      end

      def quote
        Faker::TvShows::TheFreshPrinceOfBelAir.quote
      end

      deprecate :character, 'Faker::TvShows::TheFreshPrinceOfBelAir.character', 2018, 12
      deprecate :celebrity, 'Faker::TvShows::TheFreshPrinceOfBelAir.celebrity', 2018, 12
      deprecate :quote, 'Faker::TvShows::TheFreshPrinceOfBelAir.quote', 2018, 12
    end
  end
end
