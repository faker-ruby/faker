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
        # Produces the name of a city from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.city #=> "Earthfast"
        #
        # @faker.version next
        def city
          fetch('dnd.cities')
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
        # Produces the name of a language from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.language #=> "Gnomish"
        #
        # @faker.version next
        def language
          fetch('dnd.languages')
        end

        ##
        # Produces the name of a melee weapon from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.melee_weapon #=> "Handaxe"
        #
        # @faker.version next
        def melee_weapon
          fetch('dnd.melee_weapons')
        end

        ##
        # Produces the name of a monster from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.monster #=> "Manticore"
        #
        # @faker.version next
        def monster
          fetch('dnd.monsters')
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
        # Produces the name of a ranged weapon from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.ranged_weapon #=> "Shortbow"
        #
        # @faker.version next
        def ranged_weapon
          fetch('dnd.ranged_weapons')
        end

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
