module Faker
  class HitchhikersGuideToTheGalaxy < Base
    class << self
      def character
        fetch('hitchhikers_guide_to_the_galaxy.characters')
      end

      def location
        fetch('hitchhikers_guide_to_the_galaxy.locations')
      end

      def planet
        fetch('hitchhikers_guide_to_the_galaxy.planets')
      end

      def quote
        fetch('hitchhikers_guide_to_the_galaxy.quotes')
      end

      def specie
        fetch('hitchhikers_guide_to_the_galaxy.species')
      end

      def starship
        fetch('hitchhikers_guide_to_the_galaxy.starships')
      end
    end
  end
end
