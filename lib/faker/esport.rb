module Faker
  class Esport < Base
    class << self
      def player
        fetch('esports.players')
      end

      def team
        fetch('esports.teams')
      end

      def league
        fetch('esports.leagues')
      end

      def event
        fetch('esports.events')
      end

      def game
        fetch('esports.games')
      end
    end
  end
end
