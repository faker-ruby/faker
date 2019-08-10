# frozen_string_literal: true

module Faker
  class Creature
    class Animal < Base
      class << self
        def name
          fetch('creature.animal.name')
        end
      end
    end
  end
end
