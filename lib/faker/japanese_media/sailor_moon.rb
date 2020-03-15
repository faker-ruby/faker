# frozen_string_literal: true

module Faker
  class JapaneseMedia
    class SailorMoon < Base
      class << self
        ##
        # Produces the name of a character from Sailor Moon.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::SailorMoon.character #=> "Mistress 9"
        #
        # @faker.version 1.8.0
        def character
          fetch('sailor_moon.character')
        end

        ##
        # Produces a transformation phrase from Sailor Moon.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::SailorMoon.transformation #=> "Fighter Star Power, Make Up!"
        #
        # @faker.version 1.8.0
        def transformation
          fetch('sailor_moon.transformation')
        end

        ##
        # Produces an attack phrase from Sailor Moon.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::SailorMoon.attack #=> "Jupiter Oak Evolution"
        #
        # @faker.version 1.8.0
        def attack
          fetch('sailor_moon.attack')
        end

        ##
        # Produces the name of an item from Sailor Moon.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::SailorMoon.item #=> "Crisis Moon Compact"
        #
        # @faker.version 1.8.0
        def item
          fetch('sailor_moon.item')
        end

        ##
        # Produces the name of a location from Sailor Moon.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::SailorMoon.location #=> "Game Center Crown"
        #
        # @faker.version 1.8.0
        def location
          fetch('sailor_moon.location')
        end
      end
    end
  end
end
