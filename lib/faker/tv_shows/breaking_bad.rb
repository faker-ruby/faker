# frozen_string_literal: true

module Faker
  module TvShows
    class BreakingBad < Base
      flexible :breaking_bad

      class << self
        def character
          fetch('breaking_bad.character')
        end

        def episode
          fetch('breaking_bad.episode')
        end
      end
    end
  end
end
