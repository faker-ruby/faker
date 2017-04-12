module Faker
  class StarTrek < Base
    class << self
      def characters
        fetch('star_trek.characters')
      end

      def locations
        fetch('star_trek.locations')
      end

      def species
        fetch('star_trek.species')
      end
   
      def villains
        fetch('star_trek.villains')
      end
    end
  end
end