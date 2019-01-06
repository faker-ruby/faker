# frozen_string_literal: true

module Faker
  class NewGirl < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::NewGirl.character
      end

      def quote
        Faker::TvShows::NewGirl.quote
      end

      deprecate :character, 'Faker::TvShows::NewGirl.character', 2019, 0o1
      deprecate :quote, 'Faker::TvShows::NewGirl.quote', 2019, 0o1
    end
  end
end
