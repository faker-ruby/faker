require_relative "../faker.rb"
require 'pry'

module Faker
  class StarWars < Base
    class << self
      def character
        fetch('star_wars.characters')
      end

      def droid
        fetch('star_wars.droids')
      end

      def planet
        fetch('star_wars.planets')
      end

      def quote
        fetch('star_wars.quotes')
      end

      def species
        fetch('star_wars.species')
      end

      def vehicle
        fetch('star_wars.vehicles')
      end
    end
  end
end
binding.pry
Faker::StarWars