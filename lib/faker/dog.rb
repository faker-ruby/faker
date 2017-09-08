module Faker
  class Cat < Base
    flexible :dog

    class << self
      def name
        fetch('dog.name')
      end

      def breed
        fetch('dog.breed')
      end

      def sound
        fetch('dog.sound')
      end

      def meme_phrase
        fetch('dog.meme_phrase')
      end
    end
  end
end
