# frozen_string_literal: true

module Faker
  class Sports
    class Baseball < Base
      class << self
        ##
        # Produces the name of a baseball league.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::Baseball.league #=> "National League"
        #
        # @faker.version next
        def league
          fetch('baseball.leagues')
        end

        ##
        # Produces the name of a baseball team.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::Baseball.team #=> "Chicago Cubs"
        #
        # @faker.version next
        def team
          fetch('baseball.teams')
        end

        ##
        # Produces the name of a baseball player.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::Baseball.player #=> "Shota Imanaga"
        #
        # @faker.version next
        def player
          fetch('baseball.players')
        end

        ##
        # Produces a position in baseball.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::Baseball.position #=> "Pitcher"
        #
        # @faker.version next
        def position
          fetch('baseball.positions')
        end
      end
    end
  end
end
