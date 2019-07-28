# frozen_string_literal: true

module Faker
  class TvShows
    class SouthPark < Base
      flexible :south_park

      class << self
        def character
          fetch('south_park.characters')
        end

        def quote
          fetch('south_park.quotes')
        end
      end
    end
  end
end
