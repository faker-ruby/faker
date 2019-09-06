# frozen_string_literal: true

module Faker
  class WorldCup < Base
    class << self
      def team
        fetch('world_cup.teams')
      end

      def city
        fetch('world_cup.cities')
      end

      def stadium
        fetch('world_cup.stadiums')
      end

      def group(legacy_group = NOT_GIVEN, group: 'group_A')
        warn_for_deprecated_arguments do |keywords|
          keywords << :group if legacy_group != NOT_GIVEN
        end

        fetch("world_cup.groups.#{group}")
      end

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
