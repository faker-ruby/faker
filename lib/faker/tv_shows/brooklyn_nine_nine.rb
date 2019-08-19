# frozen_string_literal: true

module Faker
  class TvShows
    class BrooklynNineNine < Base
      flexible :brooklyn_nine_nine

      class << self
        def character
          fetch('brooklyn_nine_nine.character')
        end

        def episode
          fetch('brooklyn_nine_nine.episode')
        end

        def quote
          fetch('brooklyn_nine_nine.quote')
        end
      end
    end
  end
end
