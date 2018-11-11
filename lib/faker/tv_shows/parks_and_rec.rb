# frozen_string_literal: true

module Faker
  module TvShows
    class ParksAndRec < Base
      flexible :parks_and_rec

      class << self
        def character
          fetch('parks_and_rec.characters')
        end

        def city
          fetch('parks_and_rec.cities')
        end
      end
    end
  end
end
