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
    end
  end
end
