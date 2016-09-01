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

      def specie
        species.sample
      end

      def vehicle
        fetch('star_wars.vehicles')
      end

      def species
        ['Ewok', 'Hutt', 'Gungan', 'Ithorian', 'Jawa', 'Neimoidian', 'Sullustan', 'Wookiee', 'Mon Calamari']
      end

    end
  end
end
