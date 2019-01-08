# frozen_string_literal: true

module Faker
  class Community
    class << self
      extend Gem::Deprecate

      def characters
        Faker::TvShows::Community.characters
      end

      def quotes
        Faker::TvShows::Community.quotes
      end

      deprecate :characters, 'Faker::TvShows::Community.characters', 2019, 01
      deprecate :quotes, 'Faker::TvShows::Community.quotes', 2019, 01
    end
  end
end
