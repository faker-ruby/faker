# frozen_string_literal: true

module Faker
  class JapaneseMedia
    class DragonBall < Base
      class << self
        ##
        # Produces the name of a character from Dragon Ball.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::DragonBall.character #=> "Goku"
        #
        # @faker.version 1.8.0
        def character
          fetch('dragon_ball.characters')
        end
      end
    end
  end
end
