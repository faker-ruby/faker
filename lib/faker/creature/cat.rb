# frozen_string_literal: true

module Faker
  class Creature
    class Cat < Base
      flexible :cat

      class << self
        def name
          fetch('creature.cat.name')
        end

        def breed
          fetch('creature.cat.breed')
        end

        def registry
          fetch('creature.cat.registry')
        end
      end
    end
  end
end
