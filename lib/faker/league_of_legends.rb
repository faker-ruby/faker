module Faker
  class LeagueOfLegends < Base
    class << self
      def champions
        fetch('league_of_legends.champions')
      end

      def location
        fetch('league_of_legends.location')
      end

      def quotes
        fetch('league_of_legends.quotes')
      end
    end
  end
end
