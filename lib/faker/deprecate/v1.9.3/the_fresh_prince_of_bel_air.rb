# frozen_string_literal: true

module Faker
  class TheFreshPrinceOfBelAir
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

      deprecate :character, 'Faker::TvShows::TheFreshPrinceOfBelAir.character', 2019, 01
      deprecate :celebrity, 'Faker::TvShows::TheFreshPrinceOfBelAir.celebrity', 2019, 01
      deprecate :quote, 'Faker::TvShows::TheFreshPrinceOfBelAir.quote', 2019, 01
    end
  end
end
