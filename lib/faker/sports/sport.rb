# frozen_string_literal: true

module Faker
  class Sport < Base
    class << self
      ##
      # Produces the name of a sport from any category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Sports.sport #=> "Football"
      #
      # @faker.version next
      def sport
        sample(fetch_all('sport.summer_olympics') + fetch_all('sport.winter_olympics') + fetch_all('sport.summer_paralympics') + fetch_all('sport.winter_paralympics') + fetch_all('sport.ancient_olympics') + fetch_all('sport.unusual'))
      end

      ##
      # Produces a sport from the summer olympics.
      #
      # @return [String]
      #
      # @example
      #   Faker::Sports.summer_olympics_sport #=> "Archery"
      #
      # @faker.version next
      def summer_olympics_sport
        fetch('sport.summer_olympics')
      end

      ##
      # Produces a sport from the winter olympics.
      #
      # @return [String]
      #
      # @example
      #   Faker::Sports.winter_olympics_sport #=> "Bobsleigh"
      #
      # @faker.version next
      def winter_olympics_sport
        fetch('sport.winter_olympics')
      end

      ##
      # Produces a sport from the summer paralympics.
      #
      # @return [String]
      #
      # @example
      #   Faker::Sports.summer_paralympics_sport #=> "Wheelchair Basketball"
      #
      # @faker.version next
      def summer_paralympics_sport
        fetch('sport.summer_paralympics')
      end

      ##
      # Produces a sport from the winter paralympics.
      #
      # @return [String]
      #
      # @example
      #   Faker::Sports.winter_paralympics_sport #=> "Para Ice Hockey"
      #
      # @faker.version next
      def winter_paralympics_sport
        fetch('sport.winter_paralympics')
      end

      ##
      # Produces an unusual sport.
      #
      # @return [String]
      #
      # @example
      #   Faker::Sports.unusual_sport #=> "Camel Jumping"
      #
      # @faker.version next
      def unusual_sport
        fetch('sport.unusual')
      end

      ##
      # Produces a sport from the modern olympics or paralympics, summer or winter.
      #
      # @return [String]
      #
      # @example
      #   Faker::Sports.modern_olympics_sport #=> "Skeleton"
      #
      # @faker.version next
      def modern_olympics_sport
        sample(fetch_all('sport.summer_olympics') + fetch_all('sport.winter_olympics') + fetch_all('sport.summer_paralympics') + fetch_all('sport.winter_paralympics'))
      end

      ##
      # Produces a sport from the ancient olympics.
      #
      # @return [String]
      #
      # @example
      #   Faker::Sports.ancient_olympics_sport #=> "Pankration"
      #
      # @faker.version next
      def ancient_olympics_sport
        fetch('sport.ancient_olympics')
      end
    end
  end
end
