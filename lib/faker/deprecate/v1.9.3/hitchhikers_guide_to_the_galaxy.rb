# frozen_string_literal: true

module Faker
  class HitchhikersGuideToTheGalaxy
    class << self
      extend Gem::Deprecate

      def character
        Faker::Movies::HitchhikersGuideToTheGalaxy.character
      end

      def location
        Faker::Movies::HitchhikersGuideToTheGalaxy.location
      end

      def marvin_quote
        Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote
      end

      def planet
        Faker::Movies::HitchhikersGuideToTheGalaxy.planet
      end

      def quote
        Faker::Movies::HitchhikersGuideToTheGalaxy.quote
      end

      def specie
        Faker::Movies::HitchhikersGuideToTheGalaxy.specie
      end

      def starship
        Faker::Movies::HitchhikersGuideToTheGalaxy.starship
      end

      deprecate :character, 'Faker::Movies::HitchhikersGuideToTheGalaxy.character', 2019, 01
      deprecate :location, 'Faker::Movies::HitchhikersGuideToTheGalaxy.location', 2019, 01
      deprecate :marvin_quote, 'Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote', 2019, 01
      deprecate :planet, 'Faker::Movies::HitchhikersGuideToTheGalaxy.planet', 2019, 01
      deprecate :specie, 'Faker::Movies::HitchhikersGuideToTheGalaxy.specie', 2019, 01
      deprecate :starship, 'Faker::Movies::HitchhikersGuideToTheGalaxy.starship', 2019, 01
    end
  end
end
