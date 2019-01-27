# frozen_string_literal: true

module Faker
  class NewGirl
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::NewGirl.character
      end

      def quote
        Faker::TvShows::NewGirl.quote
      end

      deprecate :character, 'Faker::TvShows::NewGirl.character', 2019, 01
      deprecate :quote, 'Faker::TvShows::NewGirl.quote', 2019, 01
    end
  end
end
