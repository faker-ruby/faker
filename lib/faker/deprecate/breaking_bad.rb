# frozen_string_literal: true

module Faker
  class BreakingBad < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::BreakingBad.character
      end

      def episode
        Faker::TvShows::BreakingBad.episode
      end

      deprecate :character, 'Faker::TvShows::BreakingBad.character', 2018, 12
      deprecate :episode, 'Faker::TvShows::BreakingBad.episode', 2018, 12
    end
  end
end
