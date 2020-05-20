# frozen_string_literal: true

module Faker
  class Games
    class DnD < Base
      class << self
        ##
        # Produces the name of a race from Dungeons and Dragons (PHB).
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.race #=> "Dwarf"
        #
        # @faker.version next
        def species
          fetch('dnd.species')
        end

        ##
        # Produces the name of a class from Dungeons and Dragons (PHB).
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.klass #=> "Warlock"
        #
        # @faker.version next
        def klass
          fetch('dnd.klasses')
        end

        ##
        # Produces the name of a background from Dungeons and Dragons (PHB).
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.background #=> "Urchin"
        #
        # @faker.version next
        def background
          fetch('dnd.backgrounds')
        end

        ##
        # Produces the name of an alignment from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.alignment #=> "Lawful Neutral"
        #
        # @faker.version next
        def alignment
          fetch('dnd.alignments')
        end
      end
    end
  end
end
