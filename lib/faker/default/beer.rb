# frozen_string_literal: true

module Faker
  class Beer < Base
    flexible :beer

    class << self
      ##
      # Produces a random beer name.
      #
      # @return [String]
      #
      # @example
      #   Faker::Beer.name #=> "Pliny The Elder"
      #
      # @faker.version next
      def name
        fetch('beer.name')
      end

      ##
      # Produces a random beer style.
      #
      # @return [String]
      #
      # @example
      #   Faker::Beer.style #=> "Wood-aged Beer"
      #
      # @faker.version next
      def style
        fetch('beer.style')
      end

      ##
      # Produces a random beer hops .
      #
      # @return [String]
      #
      # @example
      #   Faker::Beer.hop #=> "Sterling"
      #
      # @faker.version next
      def hop
        fetch('beer.hop')
      end

      ##
      # Produces a random beer yeast.
      #
      # @return [String]
      #
      # @example
      #   Faker::Beer.yeast #=> "5335 - Lactobacillus"
      #
      # @faker.version next
      def yeast
        fetch('beer.yeast')
      end

      ##
      # Produces a random beer malts.
      #
      # @return [String]
      #
      # @example
      #   Faker::Beer.malts #=> "Munich"
      #
      # @faker.version next
      def malts
        fetch('beer.malt')
      end

      ##
      # Produces a random beer ibu.
      #
      # @return [String]
      #
      # @example
      #   Faker::Beer.ibu #=> "87 IBU"
      #
      # @faker.version next
      def ibu
        rand(10..100).to_s + ' IBU'
      end

      ##
      # Produces a random beer alcohol percentage.
      #
      # @return [String]
      #
      # @example
      #   Faker::Beer.alcohol #=> "5.4%"
      #
      # @faker.version next
      def alcohol
        rand(2.0..10.0).round(1).to_s + '%'
      end

      ##
      # Produces a random beer blg level.
      #
      # @return [String]
      #
      # @example
      #   Faker::Beer.blg #=> "5.1Blg"
      #
      # @faker.version next
      def blg
        rand(5.0..20.0).round(1).to_s + '°Blg'
      end
    end
  end
end
