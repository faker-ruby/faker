# frozen_string_literal: true

module Faker
  module Dog
    class << self
      extend Gem::Deprecate

      def name
        Faker::Creature::Dog.name
      end

      def breed
        Faker::Creature::Dog.breed
      end

      def sound
        Faker::Creature::Dog.sound
      end

      def meme_phrase
        Faker::Creature::Dog.meme_phrase
      end

      def age
        Faker::Creature::Dog.age
      end

      def gender
        Faker::Creature::Dog.gender
      end

      def coat_length
        Faker::Creature::Dog.coat_length
      end

      def size
        Faker::Creature::Dog.size
      end

      deprecate :name, 'Faker::Creature::Dog.name', 2018, 10
      deprecate :breed, 'Faker::Creature::Dog.breed', 2018, 10
      deprecate :sound, 'Faker::Creature::Dog.sound', 2018, 10
      deprecate :meme_phrase, 'Faker::Creature::Dog.meme_phrase', 2018, 10
      deprecate :age, 'Faker::Creature::Dog.age', 2018, 10
      deprecate :gender, 'Faker::Creature::Dog.gender', 2018, 10
      deprecate :coat_length, 'Faker::Creature::Dog.coat_length', 2018, 10
      deprecate :size, 'Faker::Creature::Dog.size', 2018, 10
    end
  end
end
