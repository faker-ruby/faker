# frozen_string_literal: true

module Faker
  module ElderScrolls
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

      deprecate :race, 'Faker::Games::ElderScrolls.race', 2018, 10
      deprecate :city, 'Faker::Games::ElderScrolls.city', 2018, 10
      deprecate :creature, 'Faker::Games::ElderScrolls.creature', 2018, 10
      deprecate :region, 'Faker::Games::ElderScrolls.region', 2018, 10
      deprecate :dragon, 'Faker::Games::ElderScrolls.dragon', 2018, 10
      deprecate :name, 'Faker::Games::ElderScrolls.name', 2018, 10
      deprecate :first_name, 'Faker::Games::ElderScrolls.first_name', 2018, 10
      deprecate :last_name, 'Faker::Games::ElderScrolls.last_name', 2018, 10
    end
  end
end
