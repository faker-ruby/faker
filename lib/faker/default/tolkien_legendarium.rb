# frozen_string_literal: true

module Faker
  class TolkienLegendarium < Base
    flexible :tolkien
    class << self
      ##
      # Produces a character from Tolkien's legendarium
      #
      # @return [String]
      #
      # @example
      #   Faker::Movies::LordOfTheRings.character #=> "Legolas"
      #
      # @faker.version 1.7.0
      def character
        fetch('tolkien.lord_of_the_rings.characters')
      end

      ##
      # Produces a location from Tolkien's legendarium
      #
      # @return [String]
      #
      # @example
      #   Faker::Movies::LordOfTheRings.location #=> "Helm's Deep"
      #
      # @faker.version 1.7.0
      def location
        fetch('tolkien.lord_of_the_rings.locations')
      end

      ##
      # Produces a quote from Tolkien's legendarium
      #
      # @return [String]
      #
      # @example
      #   Faker::Movies::LordOfTheRings.quote
      #     #=> "I wish the Ring had never come to me. I wish none of this had happened."
      #
      # @faker.version 1.9.0
      def quote
        fetch('tolkien.lord_of_the_rings.quotes')
      end
    end
  end
end
