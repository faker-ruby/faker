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

      def quotes(character = nil)
        quoted_characters = translate('faker.star_wars.quotes').keys

        if character.nil?
          character = sample(quoted_characters).to_s
        else
          character.to_s.downcase!

          # check alternate spellings, nicknames, titles of characters
          # darth_vader: ['vader', 'darth', 'james earl jones']
          # if darth_vader.include? character
          #   character = :darth_vader

          unless quoted_characters.include?(character.to_sym)
            raise ArgumentError,
              "Character for quotes can be left blank or #{quoted_characters.join(', ')}"
        end

        fetch('star_wars.quotes.' + character)
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

      def alternate_character_spelling

      end
    end
  end
end
