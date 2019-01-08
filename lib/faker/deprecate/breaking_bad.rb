# frozen_string_literal: true

module Faker
  class BreakingBad
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::BreakingBad.character
      end

      def episode
        Faker::TvShows::BreakingBad.episode
      end

      deprecate :character, 'Faker::TvShows::BreakingBad.character', 2019, 01
      deprecate :episode, 'Faker::TvShows::BreakingBad.episode', 2019, 01
    end
  end
end
