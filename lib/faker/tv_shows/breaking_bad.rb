# frozen_string_literal: true

module Faker
  module TvShows
    class BreakingBad < Base
      flexible :breaking_bad

      def self.character
        fetch('breaking_bad.character')
      end

      def self.episode
        fetch('breaking_bad.episode')
      end
    end
  end
end
