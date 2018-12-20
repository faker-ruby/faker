# frozen_string_literal: true

module Faker
  module Movies
    class HarryPotter < Base
      class << self
        def character
          fetch('harry_potter.characters')
        end

        def location
          fetch('harry_potter.locations')
        end

        def quote
          fetch('harry_potter.quotes')
        end

        def book
          fetch('harry_potter.books')
        end

        def house
          fetch('harry_potter.houses')
        end

        def spell
          fetch('harry_potter.spells')
        end
        
        def wand_core
          fetch('harry_potter.wand_core')
        end
        
        def wand_wood
          fetch('harry_potter.wand_wood')
        end
      end
    end
  end
end
