# frozen_string_literal: true

module Faker
  class StarWars < Base
    class << self
      extend Gem::Deprecate

      def call_squadron
        Faker::Movies::StarWars.call_squadron
      end

      def call_sign
        Faker::Movies::StarWars.call_sign
      end

      def call_number
        Faker::Movies::StarWars.call_number
      end

      def character
        Faker::Movies::StarWars.character
      end

      def droid
        Faker::Movies::StarWars.droid
      end

      def planet
        Faker::Movies::StarWars.planet
      end

      def specie
        Faker::Movies::StarWars.specie
      end

      def vehicle
        Faker::Movies::StarWars.vehicle
      end

      def wookiee_sentence
        Faker::Movies::StarWars.wookiee_sentence
      end

      def quote(character = nil)
        Faker::Movies::StarWars.quote(character)
      end

      deprecate :call_squadron, 'Faker::Movies::StarWars.call_squadron', 2019, 01
      deprecate :call_sign, 'Faker::Movies::StarWars.call_sign', 2019, 01
      deprecate :call_number, 'Faker::Movies::StarWars.call_number', 2019, 01
      deprecate :character, 'Faker::Movies::StarWars.character', 2019, 01
      deprecate :droid, 'Faker::Movies::StarWars.droid', 2019, 01
      deprecate :planet, 'Faker::Movies::StarWars.planet', 2019, 01
      deprecate :specie, 'Faker::Movies::StarWars.specie', 2019, 01
      deprecate :vehicle, 'Faker::Movies::StarWars.vehicle', 2019, 01
      deprecate :wookiee_sentence, 'Faker::Movies::StarWars.wookiee_sentence', 2019, 01
      deprecate :quote, 'Faker::Movies::StarWars.quote', 2019, 01

      def call_numbers
        fetch_all('star_wars.call_numbers')
      end

      def call_squadrons
        fetch_all('star_wars.call_squadrons')
      end

      def characters
        fetch_all('star_wars.characters')
      end

      def droids
        fetch_all('star_wars.droids')
      end

      def planets
        fetch_all('star_wars.planets')
      end

      def species
        fetch_all('star_wars.species')
      end

      def vehicles
        fetch_all('star_wars.vehicles')
      end

      def wookiee_words
        fetch_all('star_wars.wookiee_words')
      end

      alias wookie_sentence wookiee_sentence
      alias wookie_words wookiee_words
    end
  end
end
