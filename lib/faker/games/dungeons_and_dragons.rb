# frozen_string_literal: true

module Faker
  class Games
    class DungeonsAndDragons < Base
      class << self
        ##
        # Produces the name of a set or piece of armor from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.armor #=> "Leather Armor"
        #
        # @faker.version next
        def armor
          fetch('games.dungeons_and_dragons.armor')
        end

        ##
        # Produces the name of a player character class from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.player_class #=> "Paladin"
        #
        # @faker.version next
        def player_class
          fetch('games.dungeons_and_dragons.player_class')
        end

        ##
        # Produces the name of a monster from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.monster #=> "Ancient Red Dragon"
        #
        # @faker.version next
        def monster
          fetch('games.dungeons_and_dragons.monster')
        end

        ##
        # Produces the name of a race from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.race #=> "Dwarf"
        #
        # @faker.version next
        def race
          fetch('games.dungeons_and_dragons.race')
        end

        ##
        # Produces the name of a spell from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.spell #=> "Fireball"
        #
        # @faker.version next
        def spell
          fetch('games.dungeons_and_dragons.spell')
        end

        ##
        # Produces the name of a weapon from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.weapon #=> "Battleaxe"
        #
        # @faker.version next
        def weapon
          fetch('games.dungeons_and_dragons.weapon')
        end
      end
    end
  end
end
