# frozen_string_literal: true

module Faker
  class Music
    class Instruments < Base
      class << self
        ##
        # Produces the name of a guitar.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.common.guitars #=> "Acoustic Guitar"
        #
        # @faker.version next
        def guitars
          fetch('musical_instruments.common.guitars')
        end

        ##
        # Produces the name of a common woodwind instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.common.woodwinds #=> "Flute"
        #
        # @faker.version next
        def woodwinds
          fetch('musical_instruments.common.woodwinds')
        end

        ##
        # Produces the name of a common brass instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.common.brass #=> "Trumpet in B-flat"
        #
        # @faker.version next
        def brass
          fetch('musical_instruments.common.brass')
        end

        ##
        # Produces the name of a common unpitched percussion instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.common.unpitched_percussion #=> "Snare Drum"
        #
        # @faker.version next
        def unpitched_percussion
          fetch('musical_instruments.common.unpitched_percussion')
        end

        ##
        # Produces the name of a common pitched percussion instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.common.pitched_percussion #=> "Xylophone"
        #
        # @faker.version next
        def pitched_percussion
          fetch('musical_instruments.common.pitched_percussion')
        end

        ##
        # Produces the name of a common keyboard instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.common.keyboards #=> "Grand Piano"
        #
        # @faker.version next
        def keyboards
          fetch('musical_instruments.common.keyboards')
        end

        ##
        # Produces the name of a common string instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.common.strings #=> "Violin"
        #
        # @faker.version next
        def strings
          fetch('musical_instruments.common.strings')
        end

        ##
        # Produces the name of a common vocal part.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.common.singers #=> "Soprano"
        #
        # @faker.version next
        def singers
          fetch('musical_instruments.common.singers')
        end

        ##
        # Produces the name of an uncommon woodwind instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.uncommon_and_world.woodwinds #=> "Shakuhachi"
        #
        # @faker.version next
        def uncommon_woodwinds
          fetch('musical_instruments.uncommon_and_world.woodwinds')
        end

        ##
        # Produces the name of an uncommon brass instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.uncommon_and_world.brass #=> "Ophicleide"
        #
        # @faker.version next
        def uncommon_brass
          fetch('musical_instruments.uncommon_and_world.brass')
        end

        ##
        # Produces the name of an uncommon unpitched percussion instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.uncommon_and_world.unpitched_percussion #=> "Anvil"
        #
        # @faker.version next
        def uncommon_unpitched_percussion
          fetch('musical_instruments.uncommon_and_world.unpitched_percussion')
        end

        ##
        # Produces the name of an uncommon pitched percussion instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.uncommon_and_world.pitched_percussion #=> "Cimbalom"
        #
        # @faker.version next
        def uncommon_pitched_percussion
          fetch('musical_instruments.uncommon_and_world.pitched_percussion')
        end

        ##
        # Produces the name of an uncommon keyboard instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.uncommon_and_world.keyboards #=> "Seaboard"
        #
        # @faker.version next
        def uncommon_keyboards
          fetch('musical_instruments.uncommon_and_world.keyboards')
        end

        ##
        # Produces the name of an uncommon string instrument.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.uncommon_and_world.strings #=> "Dulcimer"
        #
        # @faker.version next
        def uncommon_strings
          fetch('musical_instruments.uncommon_and_world.strings')
        end

        ##
        # Produces the name of an uncommon vocal part.
        #
        # @return [String]
        #
        # @example
        #   Faker::MusicalInstruments.uncommon_and_world.singers #=> "Castrato"
        #
        # @faker.version next
        def uncommon_singers
          fetch('musical_instruments.uncommon_and_world.singers')
        end
      end
    end
  end
end
