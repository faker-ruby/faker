# frozen_string_literal: true

module Faker
  class Games
    class StreetFighter < Base
      class << self
        ##
        # Produces the name of a playable character from Street Fighter.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::StreetFighter.character #=> "Ryu"
        #
        # @faker.version next
        def character
          fetch('games.street_fighter.characters')
        end

        ##
        # Produces the name of a stage from Street Fighter.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::StreetFighter.stage #=> "Volcanic Rim"
        #
        # @faker.version next
        def stage
          fetch('games.street_fighter.stages')
        end

        ##
        # Produces a quote from Street Fighter.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::StreetFighter.quote #=> "Go home and be a family man."
        #
        # @faker.version next
        def quote
          fetch('games.street_fighter.quotes')
        end

        ##
        # Produces the name of a move from Street Fighter.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::StreetFighter.move #=> "Shoryuken"
        #
        # @faker.version next
        def move
          fetch('games.street_fighter.moves')
        end
      end
    end
  end
end
