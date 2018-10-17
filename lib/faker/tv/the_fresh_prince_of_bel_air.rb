# frozen_string_literal: true

module Faker
  module TV
    class TheFreshPrinceOfBelAir < Base
      class << self
        def character
          fetch('the_fresh_prince_of_bel_air.characters')
        end

        def celebrity
          fetch('the_fresh_prince_of_bel_air.celebrities')
        end

        def quote
          fetch('the_fresh_prince_of_bel_air.quotes')
        end
      end
    end
  end
end
