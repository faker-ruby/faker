# frozen_string_literal: true

module Faker
  class TvShows
    class Simpsons < Base
      flexible :simpsons

      class << self
        def character
          fetch('simpsons.characters')
        end

        def location
          fetch('simpsons.locations')
        end

        def quote
          fetch('simpsons.quotes')
        end
      end
    end
  end
end
