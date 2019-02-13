# frozen_string_literal: true

module Faker
  class Dog
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

      deprecate :name, 'Faker::Creature::Dog.name', 2019, 01
      deprecate :breed, 'Faker::Creature::Dog.breed', 2019, 01
      deprecate :sound, 'Faker::Creature::Dog.sound', 2019, 01
      deprecate :meme_phrase, 'Faker::Creature::Dog.meme_phrase', 2019, 01
      deprecate :age, 'Faker::Creature::Dog.age', 2019, 01
      deprecate :gender, 'Faker::Creature::Dog.gender', 2019, 01
      deprecate :coat_length, 'Faker::Creature::Dog.coat_length', 2019, 01
      deprecate :size, 'Faker::Creature::Dog.size', 2019, 01
    end
  end
end
