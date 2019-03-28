# frozen_string_literal: true

module Faker
  class Football
    class << self
      extend Gem::Deprecate

      def team
        Faker::Sports::Football.team
      end

      def player
        Faker::Sports::Football.player
      end

      def coach
        Faker::Sports::Football.coach
      end

      def competition
        Faker::Sports::Football.competition
      end

      def position
        Faker::Sports::Football.position
      end

      deprecate :team, 'Faker::Sports::Football.team', 2019, 04
      deprecate :player, 'Faker::Sports::Football.player', 2019, 04
      deprecate :coach, 'Faker::Sports::Football.coach', 2019, 04
      deprecate :competition, 'Faker::Sports::Football.competition', 2019, 04
      deprecate :position, 'Faker::Sports::Football.position', 2019, 04
    end
  end
end
