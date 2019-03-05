# frozen_string_literal: true

module Faker
  module Creature
    class Horse < Base
      flexible :horse

      class << self
        def name
          fetch('creature.horse.name')
        end

        def breed
          fetch('creature.horse.breed')
        end
      end
    end
  end
end
