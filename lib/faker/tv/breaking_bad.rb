# frozen_string_literal: true

module Faker
  module TV
    class BreakingBad < Base
      def self.character
        fetch('breaking_bad.character')
      end

      def self.episode
        fetch('breaking_bad.episode')
      end
    end
  end
end
