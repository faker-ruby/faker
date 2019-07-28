# frozen_string_literal: true

module Faker
  class TvShows
    class StarTrek < Base
      flexible :star_trek

      class << self
        def character
          fetch('star_trek.character')
        end

        def location
          fetch('star_trek.location')
        end

        def specie
          fetch('star_trek.specie')
        end

        def villain
          fetch('star_trek.villain')
        end
      end
    end
  end
end
