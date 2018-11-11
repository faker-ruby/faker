# frozen_string_literal: true

module Faker
  class DumbAndDumber < Base
    class << self
      extend Gem::Deprecate

      def actor
        Faker::TvShows::DumbAndDumber.actor
      end

      def character
        Faker::TvShows::DumbAndDumber.character
      end

      def quote
        Faker::TvShows::DumbAndDumber.quote
      end

      deprecate :actor, 'Faker::TvShows::DumbAndDumber.actor', 2018, 10
      deprecate :character, 'Faker::TvShows::DumbAndDumber.character', 2018, 10
      deprecate :quote, 'Faker::TvShows::DumbAndDumber.quote', 2018, 10
    end
  end
end
