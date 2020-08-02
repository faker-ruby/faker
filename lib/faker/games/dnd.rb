# frozen_string_literal: true

module Faker
  class Games
    class DnD < Base
      class << self
        ##
        # Produces the name of an alignment from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.alignment #=> "Lawful Neutral"
        #
        # @faker.version 2.13.0
        def alignment
          fetch('dnd.alignments')
        end

        ##
        # Produces the name of a background from Dungeons and Dragons (PHB).
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.background #=> "Urchin"
        #
        # @faker.version 2.13.0
        def background
          fetch('dnd.backgrounds')
        end

        ##
        # Produces the name of a class from Dungeons and Dragons (PHB).
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.klass #=> "Warlock"
        #
        # @faker.version 2.13.0
        def klass
          fetch('dnd.klasses')
        end

        ##
        # Produces the name of a race from Dungeons and Dragons (PHB).
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.races #=> "Dwarf"
        #
        # @faker.version next
        def race
          fetch('dnd.races')
        end

        ##
        # This method is deprecated. The implementation will be removed in a near future release.
        # Use `DnD.race` instead.
        #
        # @deprecated Use {#race} instead.
        def species
          warn '`DnD.species` is deprecated. Use `DnD.race` instead.'

          super
        end
      end
    end
  end
end
