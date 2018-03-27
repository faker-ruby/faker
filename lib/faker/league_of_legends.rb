module Faker
  class LeagueOfLegends < Base
    class << self
      def champion
        fetch('league_of_legends.champion')
      end

      def location
        fetch('league_of_legends.location')
      end

      def quote
        fetch('league_of_legends.quote')
      end

      def summoner_spell
        fetch('league_of_legends.summoner_spell')
      end

      def masteries
        fetch('league_of_legends.masteries')
      end

      def rank
        fetch('league_of_legends.rank')
      end

      def lane
        fetch("league_of_legends.lane")
      end

      def game_role
        fetch("league_of_legends.game_role")
      end

      def champion_role
        fetch("league_of_legends.champion_role")
      end
    end
  end
end
