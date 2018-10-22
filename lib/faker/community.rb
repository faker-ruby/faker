# frozen_string_literal: true

module Faker
  class Community < Base
    class << self
      extend Gem::Deprecate

      def characters
        fetch('community.characters')
      end

      def quotes
        fetch('community.quotes')
      end

      deprecate :characters, 'Faker::TvShows::Community.character', 2018, 10
      deprecate :quotes, 'Faker::TvShows::Community.quotes', 2018, 10
    end
  end
end
