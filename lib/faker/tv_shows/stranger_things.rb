# frozen_string_literal: true

module Faker
  class TvShows
    class StrangerThings < Base
      flexible :stranger_things

      class << self
        def quote
          fetch('stranger_things.quote')
        end

        def character
          fetch('stranger_things.character')
        end
      end
    end
  end
end
