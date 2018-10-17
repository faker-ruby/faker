# frozen_string_literal: true

module Faker
  module TV
    class AquaTeenHungerForce < Base
      class << self
        def character
          fetch('aqua_teen_hunger_force.character')
        end
      end
    end
  end
end
