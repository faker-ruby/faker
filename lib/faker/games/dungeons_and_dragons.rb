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
        # Produces the name of a character subclass from Dungeons and Dragons.
        #
        # @param player_class [String] The name of a class to derive a subclass from.
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.subclass #=> "Champion"
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.subclass(player_class: "rogue")
        #     #=> "Thief"
        #
        # @faker.version next
        def subclass(legacy_class = NOT_GIVEN, player_class: nil)
          warn_for_deprecated_arguments do |keywords|
            keywords << :player_class if legacy_class != NOT_GIVEN
          end

          classes = translate('faker.games.dungeons_and_dragons.subclass')

          if player_class.nil?
            player_class = sample(classes.keys).to_s
          else
            player_class = player_class.to_s.downcase
            raise ArgumentError, "Character for quotes can be left blank or #{classes.keys.join(', ')}" unless classes.key?(player_class.to_sym)
          end

          fetch('games.dungeons_and_dragons.subclass.' + player_class)
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
        # Produces the name of a school of magic from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.magic_school #=> "Illusion"
        #
        # @faker.version next
        def magic_school
          fetch('games.dungeons_and_dragons.magic_school')
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
