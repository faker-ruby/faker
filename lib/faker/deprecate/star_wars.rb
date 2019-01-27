# frozen_string_literal: true

module Faker
  class StarWars
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
        Faker::Movies::StarWars.call_numbers
      end

      def call_squadrons
        Faker::Movies::StarWars.call_squadrons
      end

      def characters
        Faker::Movies::StarWars.characters
      end

      def droids
        Faker::Movies::StarWars.droids
      end

      def planets
        Faker::Movies::StarWars.planets
      end

      def species
        Faker::Movies::StarWars.species
      end

      def vehicles
        Faker::Movies::StarWars.vehicles
      end

      def wookiee_words
        Faker::Movies::StarWars.wookiee_words
      end

      alias wookie_sentence wookiee_sentence
      alias wookie_words wookiee_words
    end
  end
end
