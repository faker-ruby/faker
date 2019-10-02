# frozen_string_literal: true

module Faker
  class Sports
    class Hockey < Base
      class << self
        ##
        # Produces the name of a hockey team.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::Hockey.team #=> "Philadelphia Flyers"
        def team
          fetch('hockey.teams')
        end

        ##
        # Produces the name of a hockey player.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::Hockey.player #=> "Claude Giroux"
        def player
          fetch('hockey.players')
        end

        ##
        # Produces the name of a hockey division.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::Hockey.division #=> "Metropolitan"
        def division
          fetch('hockey.divisions')
        end

        ##
        # Produces a hockey penalty.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::Hockey.penalty #=> "Roughing"
        def penalty
          fetch('hockey.penalties')
        end
      end
    end
  end
end
