# frozen_string_literal: true

module Faker
  class ElderScrolls
    class << self
      extend Gem::Deprecate

      def race
        Faker::Games::ElderScrolls.race
      end

      def city
        Faker::Games::ElderScrolls.city
      end

      def creature
        Faker::Games::ElderScrolls.creature
      end

      def region
        Faker::Games::ElderScrolls.region
      end

      def dragon
        Faker::Games::ElderScrolls.dragon
      end

      def name
        Faker::Games::ElderScrolls.name
      end

      def first_name
        Faker::Games::ElderScrolls.first_name
      end

      def last_name
        Faker::Games::ElderScrolls.last_name
      end

      deprecate :race, 'Faker::Games::ElderScrolls.race', 2019, 01
      deprecate :city, 'Faker::Games::ElderScrolls.city', 2019, 01
      deprecate :creature, 'Faker::Games::ElderScrolls.creature', 2019, 01
      deprecate :region, 'Faker::Games::ElderScrolls.region', 2019, 01
      deprecate :dragon, 'Faker::Games::ElderScrolls.dragon', 2019, 01
      deprecate :name, 'Faker::Games::ElderScrolls.name', 2019, 01
      deprecate :first_name, 'Faker::Games::ElderScrolls.first_name', 2019, 01
      deprecate :last_name, 'Faker::Games::ElderScrolls.last_name', 2019, 01
    end
  end
end
