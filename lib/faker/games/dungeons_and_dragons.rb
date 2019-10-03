# frozen_string_literal: true

module Faker
  class Games
    class DungeonsAndDragons < Base
      class << self
        ##
        # Produces the name of an ability from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.ability #=> "Dexterity"
        #
        # @faker.version next
        def ability
          fetch('games.dungeons_and_dragons.ability')
        end

        ##
        # Produces the name of a skill from Dungeons and Dragons.
        #
        # @param ability [String] The name of an ability to derive a skill from.
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.skill #=> "History"
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.subclass(ability: "wisdom")
        #     #=> "Perception"
        #
        # @faker.version next
        def skill(legacy_ability = NOT_GIVEN, ability: nil)
          warn_for_deprecated_arguments do |keywords|
            keywords << :ability if legacy_ability != NOT_GIVEN
          end

          abilities = translate('faker.games.dungeons_and_dragons.skill')

          if ability.nil?
            ability = sample(abilities.keys).to_s
          else
            ability = ability.to_s.downcase
            raise ArgumentError, "Ability can be left blank or #{abilities.keys.join(', ')}" unless abilities.key?(ability.to_sym)
          end

          fetch('games.dungeons_and_dragons.skill.' + ability)
        end

        ##
        # Produces the name of an alignment from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.alignment #=> "chaotic good"
        #
        # @faker.version next
        def alignment
          fetch('games.dungeons_and_dragons.alignment')
        end

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
            raise ArgumentError, "Class can be left blank or #{classes.keys.join(', ')}" unless classes.key?(player_class.to_sym)
          end

          fetch('games.dungeons_and_dragons.subclass.' + player_class)
        end

        ##
        # Produces the name of a language from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.language #=> "Elvish"
        #
        # @faker.version next
        def language
          fetch('games.dungeons_and_dragons.language')
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
        # Produces the name of a subrace from Dungeons and Dragons.
        #
        # @param race [String] The name of a race to derive a subrace from.
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.subrace #=> "High Elf"
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.subrace(race: "dwarf")
        #     #=> "Hill Dwarf"
        #
        # @faker.version next
        def subrace(legacy_race = NOT_GIVEN, race: nil)
          warn_for_deprecated_arguments do |keywords|
            keywords << :race if legacy_race != NOT_GIVEN
          end

          races = translate('faker.games.dungeons_and_dragons.subrace')

          if race.nil?
            race = sample(races.keys).to_s
          else
            race = race.to_s.downcase
            raise ArgumentError, "Race can be left blank or #{races.keys.join(', ')}" unless races.key?(race.to_sym)
          end

          fetch('games.dungeons_and_dragons.subrace.' + race)
        end

        ##
        # Produces the size of a creature from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DungeonsAndDragons.size #=> "Large"
        #
        # @faker.version next
        def size
          fetch('games.dungeons_and_dragons.size')
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
