# frozen_string_literal: true

module Faker
  class RuPaul
    class << self
      extend Gem::Deprecate

      def quote
        Faker::TvShows::RuPaul.quote
      end

      def queen
        Faker::TvShows::RuPaul.queen
      end

      deprecate :quote, 'Faker::TvShows::RuPaul.quote', 2019, 01
      deprecate :queen, 'Faker::TvShows::RuPaul.queen', 2019, 01
    end
  end
end
