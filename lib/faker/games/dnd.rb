# frozen_string_literal: true

module Faker
  class Games
    class DnD < Base
      class << self
        ##
        # Produces the name of an ability from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.ability #=> "Dexterity"
        #
        # @faker.version next
        def ability
          fetch('dnd.ability')
        end

        ##
        # Produces the name of a skill from Dungeons and Dragons.
        #
        # @param ability [String] The name of an ability to derive a skill from.
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.skill #=> "History"
        #
        # @example
        #   Faker::Games::DnD.skill(ability: "wisdom")
        #     #=> "Perception"
        #
        # @faker.version next
        def skill(legacy_ability = NOT_GIVEN, ability: nil)
          warn_for_deprecated_arguments do |keywords|
            keywords << :ability if legacy_ability != NOT_GIVEN
          end

          abilities = translate('faker.dnd.skill')

          if ability.nil?
            ability = sample(abilities.keys).to_s
          else
            ability = ability.to_s.downcase
            raise ArgumentError, "Ability can be left blank or #{abilities.keys.join(', ')}" unless abilities.key?(ability.to_sym)
          end

          fetch('dnd.skill.' + ability)
        end

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
        # Produces the name of a set or piece of armor from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.armor #=> "Leather Armor"
        #
        # @faker.version next
        def armor
          fetch('dnd.armor')
        end

        ##
        # Produces the name of a background from Dungeons and Dragons.
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
        # Produces the name of a class from Dungeons and Dragons.
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
        # Produces the name of a character subclass from Dungeons and Dragons.
        #
        # @param klass [String] The name of a class to derive a subclass from.
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.subclass #=> "Champion"
        #
        # @example
        #   Faker::Games::DnD.subclass(klass: "rogue")
        #     #=> "Thief"
        #
        # @faker.version next
        def subclass(legacy_class = NOT_GIVEN, klass: nil)
          warn_for_deprecated_arguments do |keywords|
            keywords << :klass if legacy_class != NOT_GIVEN
          end

          classes = translate('faker.dnd.subclass')

          if klass.nil?
            klass = sample(classes.keys).to_s
          else
            klass = klass.to_s.downcase
            raise ArgumentError, "Class can be left blank or #{classes.keys.join(', ')}" unless classes.key?(klass.to_sym)
          end

          fetch('dnd.subclass.' + klass)
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
        # Produces the name of a race from Dungeons and Dragons.
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
        # Produces the name of a subrace from Dungeons and Dragons.
        #
        # @param race [String] The name of a race to derive a subrace from.
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.subrace #=> "High Elf"
        #
        # @example
        #   Faker::Games::DnD.subrace(race: "dwarf")
        #     #=> "Hill Dwarf"
        #
        # @faker.version next
        def subrace(legacy_race = NOT_GIVEN, race: nil)
          warn_for_deprecated_arguments do |keywords|
            keywords << :race if legacy_race != NOT_GIVEN
          end

          races = translate('faker.dnd.subrace')

          if race.nil?
            race = sample(races.keys).to_s
          else
            race = race.to_s.downcase
            raise ArgumentError, "Race can be left blank or #{races.keys.join(', ')}" unless races.key?(race.to_sym)
          end

          fetch('dnd.subrace.' + race)
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

        ##
        # Produces the name of a spell from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.spell #=> "Fireball"
        #
        # @faker.version next
        def spell
          fetch('dnd.spell')
        end

        ##
        # Produces the name of a school of magic from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.magic_school #=> "Illusion"
        #
        # @faker.version next
        def magic_school
          fetch('dnd.magic_school')
        end

        ##
        # Produces the name of a magic item from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.magic_item #=> "Deck of Many Things"
        #
        # @faker.version next
        def magic_item
          fetch('dnd.magic_item')
        end

        ##
        # Produces the name of a weapon from Dungeons and Dragons.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DnD.weapon #=> "Battleaxe"
        #
        # @faker.version next
        def weapon
          if rand.round.zero?
            fetch('dnd.melee_weapons')
          else
            fetch('dnd.ranged_weapons')
          end
        end
      end
    end
  end
end
