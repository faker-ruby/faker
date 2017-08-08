module Faker
  class StarWars < Base
    class << self
      def character
        sample(characters)
      end

      def droid
        sample(droids)
      end

      def planet
        sample(planets)
      end

      def quote
        sample(quotes)
      end

      def specie
        sample(species)
      end

      def vehicle
        sample(vehicles)
      end

      def wookiee_sentence
        sentence = sample(wookiee_words).capitalize

        rand(0..10).times { sentence += " " + sample(wookiee_words)}

        sentence + sample(['.','?','!'])
      end

      def characters
        fetch('star_wars.characters')
      end

      def droids
        fetch('star_wars.droids')
      end

      def planets
        fetch('star_wars.planets')
      end

      def quotes
        fetch('star_wars.quotes')
      end

      def species
        fetch('star_wars.species')
      end

      def vehicles
        fetch('star_wars.vehicles')
      end

      def wookiee_words
        fetch('star_wars.wookiee_words')
      end

      alias_method :wookie_sentence, :wookiee_sentence
      alias_method :wookie_words, :wookiee_words
    end
  end
end
