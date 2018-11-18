# frozen_string_literal: true

module Faker
  class HitchhikersGuideToTheGalaxy < Base
    class << self
      extend Gem::Deprecate

      def character
        fetch('hitchhikers_guide_to_the_galaxy.characters')
      end

      def location
        fetch('hitchhikers_guide_to_the_galaxy.locations')
      end

      def marvin_quote
        fetch('hitchhikers_guide_to_the_galaxy.marvin_quote')
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

      deprecate :character, 'Faker::Movies::HitchhikersGuideToTheGalaxy.character', 2018, 12
      deprecate :location, 'Faker::Movies::HitchhikersGuideToTheGalaxy.location', 2018, 12
      deprecate :marvin_quote, 'Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote', 2018, 12
      deprecate :planet, 'Faker::Movies::HitchhikersGuideToTheGalaxy.planet', 2018, 12
      deprecate :specie, 'Faker::Movies::HitchhikersGuideToTheGalaxy.specie', 2018, 12
      deprecate :starship, 'Faker::Movies::HitchhikersGuideToTheGalaxy.starship', 2018, 12
    end
  end
end
