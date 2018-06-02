module Faker
  class WorldCup < Base
    class << self
      def team
        fetch('world_cup.teams')
      end

      def group
        fetch('world_cup.groups')
      end

      def roster
        fetch('world_cup.rosters')
      end
    end
  end
end