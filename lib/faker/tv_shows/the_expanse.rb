# frozen_string_literal: true

module Faker
  class TvShows
    class TheExpanse < Base
      flexible :the_expanse

      class << self
        def character
          fetch('the_expanse.characters')
        end

        def quote
          fetch('the_expanse.quotes')
        end

        def location
          fetch('the_expanse.locations')
        end

        def ship
          fetch('the_expanse.ships')
        end
      end
    end
  end
end
