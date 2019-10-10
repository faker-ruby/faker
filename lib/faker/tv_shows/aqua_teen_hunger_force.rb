# frozen_string_literal: true

module Faker
  class TvShows
    class AquaTeenHungerForce < Base
      flexible :aqua_teen_hunger_force

      class << self
        ##
        # Produces a character from Aqua Teen Hunger Force.
        #
        # @return [String]
        #
        # @example
        #   Faker::TvShows::AquaTeenHungerForce.character #=> "Master Shake"
        #
        # @faker.version 1.8.5
        def character
          fetch('aqua_teen_hunger_force.character')
        end
      end
    end
  end
end
