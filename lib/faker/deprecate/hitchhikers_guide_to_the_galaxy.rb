# frozen_string_literal: true

module Faker
  class HitchhikersGuideToTheGalaxy < Base
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

      deprecate :character, 'Faker::Movies::HitchhikersGuideToTheGalaxy.character', 2018, 12
      deprecate :location, 'Faker::Movies::HitchhikersGuideToTheGalaxy.location', 2018, 12
      deprecate :marvin_quote, 'Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote', 2018, 12
      deprecate :planet, 'Faker::Movies::HitchhikersGuideToTheGalaxy.planet', 2018, 12
      deprecate :specie, 'Faker::Movies::HitchhikersGuideToTheGalaxy.specie', 2018, 12
      deprecate :starship, 'Faker::Movies::HitchhikersGuideToTheGalaxy.starship', 2018, 12
    end
  end
end
