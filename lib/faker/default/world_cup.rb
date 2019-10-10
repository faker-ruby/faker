# frozen_string_literal: true

module Faker
  class WorldCup < Base
    class << self
      ##
      # Produces a national team name.
      #
      # @return [String]
      #
      # @example
      #   Faker::WorldCup.team #=> "Iran"
      #
      # @faker.version 1.9.0
      def team
        fetch('world_cup.teams')
      end

      ##
      # Produces a city name hosting the World Cup match.
      #
      # @return [String]
      #
      # @example
      #   Faker::WorldCup.city #=> "Moscow"
      #
      # @faker.version next
      def city
        fetch('world_cup.cities')
      end

      ##
      # Produces the name of a stadium that has hosted a World Cup match.
      #
      # @return [String]
      #
      # @example
      #   Faker::WorldCup.stadium #=> "Rostov Arena"
      #
      # @faker.version next
      def stadium
        fetch('world_cup.stadiums')
      end

      ##
      # Produces a random national team name from a group.
      #
      # @return [String]
      #
      # @example
      #   Faker::WorldCup.group(group: 'group_B') #=> "Spain"
      # @example
      #   Faker::WorldCup.group #=> "Russia"
      #
      # @faker.version next
      def group(legacy_group = NOT_GIVEN, group: 'group_A')
        warn_for_deprecated_arguments do |keywords|
          keywords << :group if legacy_group != NOT_GIVEN
        end

        fetch("world_cup.groups.#{group}")
      end

      ##
      # Produces a random name from national team roster.
      #
      # @return [String]
      #
      # @example
      #   Faker::WorldCup.roster #=> "Hector Cuper"
      #
      # @example
      #   Faker::WorldCup.roster(country: 'Spain', type: 'forwards') #=> "Diego Costa"
      #
      # @faker.version next
      def roster(legacy_country = NOT_GIVEN, legacy_type = NOT_GIVEN, country: 'Egypt', type: 'coach')
        warn_for_deprecated_arguments do |keywords|
          keywords << :country if legacy_country != NOT_GIVEN
          keywords << :type if legacy_type != NOT_GIVEN
        end

        fetch("world_cup.rosters.#{country}.#{type}")
      end
    end
  end
end
