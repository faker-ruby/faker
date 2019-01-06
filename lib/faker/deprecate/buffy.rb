# frozen_string_literal: true

module Faker
  class Buffy < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::Buffy.character
      end

      def quote
        Faker::TvShows::Buffy.quote
      end

      def celebrity
        Faker::TvShows::Buffy.celebrity
      end

      def big_bad
        Faker::TvShows::Buffy.big_bad
      end

      def episode
        Faker::TvShows::Buffy.episode
      end

      deprecate :character, 'Faker::TvShows::Buffy.character', 2019, 0o1
      deprecate :quote, 'Faker::TvShows::Buffy.quote', 2019, 0o1
      deprecate :celebrity, 'Faker::TvShows::Buffy.celebrity', 2019, 0o1
      deprecate :big_bad, 'Faker::TvShows::Buffy.big_bad', 2019, 0o1
      deprecate :episode, 'Faker::TvShows::Buffy.episode', 2019, 0o1
    end
  end
end
