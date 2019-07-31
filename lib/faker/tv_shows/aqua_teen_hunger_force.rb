# frozen_string_literal: true

module Faker
  class TvShows
    class AquaTeenHungerForce < Base
      flexible :aqua_teen_hunger_force

      class << self
        def character
          fetch('aqua_teen_hunger_force.character')
        end
      end
    end
  end
end
