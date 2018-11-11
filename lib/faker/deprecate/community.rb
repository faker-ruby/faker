# frozen_string_literal: true

module Faker
  class Community < Base
    class << self
      extend Gem::Deprecate

      def characters
        Faker::TvShows::Community.characters
      end

      def quotes
        Faker::TvShows::Community.quotes
      end

      deprecate :characters, 'Faker::TvShows::Community.characters', 2018, 10
      deprecate :quotes, 'Faker::TvShows::Community.quotes', 2018, 10
    end
  end
end
