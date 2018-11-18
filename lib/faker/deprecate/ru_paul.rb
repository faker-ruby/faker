# frozen_string_literal: true

module Faker
  class RuPaul < Base
    flexible :rupaul

    class << self
      extend Gem::Deprecate

      def quote
        Faker::TvShows::RuPaul.quote
      end

      def queen
        Faker::TvShows::RuPaul.queen
      end

      deprecate :quote, 'Faker::TvShows::RuPaul.quote', 2018, 12
      deprecate :queen, 'Faker::TvShows::RuPaul.queen', 2018, 12
    end
  end
end
