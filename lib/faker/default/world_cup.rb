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
        if legacy_group != NOT_GIVEN
          warn_with_uplevel 'Passing `group` with the 1st argument of `WorldCup.group` is deprecated. Use keyword argument like `WorldCup.group(group: ...)` instead.', uplevel: 1
          group = legacy_group
        end

        fetch("world_cup.groups.#{group}")
      end

      def roster(legacy_country = NOT_GIVEN, legacy_type = NOT_GIVEN, country: 'Egypt', type: 'coach')
        if legacy_country != NOT_GIVEN
          warn_with_uplevel 'Passing `country` with the 1st argument of `WorldCup.roster` is deprecated. Use keyword argument like `WorldCup.roster(country: ...)` instead.', uplevel: 1
          country = legacy_country
        end
        if legacy_type != NOT_GIVEN
          warn_with_uplevel 'Passing `type` with the 2nd argument of `WorldCup.roster` is deprecated. Use keyword argument like `WorldCup.roster(type: ...)` instead.', uplevel: 1
          type = legacy_type
        end

        fetch("world_cup.rosters.#{country}.#{type}")
      end
    end
  end
end
