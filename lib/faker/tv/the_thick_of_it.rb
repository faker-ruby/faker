# frozen_string_literal: true

module Faker
  module TV
    class TheThickOfIt < Base
      class << self
        def character
          fetch('the_thick_of_it.characters')
        end

        def department
          fetch('the_thick_of_it.departments')
        end

        def position
          fetch('the_thick_of_it.positions')
        end
      end
    end
  end
end
