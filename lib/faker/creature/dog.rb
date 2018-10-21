# frozen_string_literal: true

module Faker
  module Creature
    class Dog < Base
      flexible :dog

      class << self
        def name
          fetch('creature.dog.name')
        end

        def breed
          fetch('creature.dog.breed')
        end

        def sound
          fetch('creature.dog.sound')
        end

        def meme_phrase
          fetch('creature.dog.meme_phrase')
        end

        def age
          fetch('creature.dog.age')
        end

        def gender
          Faker::Gender.binary_type
        end

        def coat_length
          fetch('creature.dog.coat_length')
        end

        def size
          fetch('creature.dog.size')
        end
      end
    end
  end
end
