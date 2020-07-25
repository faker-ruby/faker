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
      end
    end
  end
end
