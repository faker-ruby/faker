# frozen_string_literal: true

module Faker
  class Buffy < Base
    class << self
      extend Gem::Deprecate

      def character
        fetch('buffy.characters')
      end

      def quote
        fetch('buffy.quotes')
      end

      def celebrity
        fetch('buffy.celebrities')
      end

      def big_bad
        fetch('buffy.big_bads')
      end

      def episode
        fetch('buffy.episodes')
      end

      deprecate :character, 'Faker::TvShows::Buffy.character', 2018, 10
      deprecate :quote, 'Faker::TvShows::Buffy.quote', 2018, 10
      deprecate :celebrity, 'Faker::TvShows::Buffy.celebrity', 2018, 10
      deprecate :big_bad, 'Faker::TvShows::Buffy.big_bad', 2018, 10
      deprecate :episode, 'Faker::TvShows::Buffy.episode', 2018, 10
    end
  end
end
