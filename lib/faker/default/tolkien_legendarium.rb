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
      #   Faker::TolkienLegendarium.character
      #    #=> "Goldberry"
      #
      # @faker.version next
      def character
        fetch('tolkien_legendarium.characters')
      end

      ##
      # Produces a location from Tolkien's legendarium
      #
      # @return [String]
      #
      # @example
      #   Faker::TolkienLegendarium.location
      #    #=> "Helm's Deep"
      #
      # @faker.version next
      def location
        fetch('tolkien_legendarium.locations')
      end

      ##
      # Produces a race from Tolkien's legendarium
      #
      # @return [String]
      #
      # @example
      #   Faker::TolkienLegendarium.race
      #     #=> "Uruk-hai"
      #
      # @faker.version next
      def race
        fetch('tolkien_legendarium.races')
      end

      ##
      # Produces the name of a poem from Tolkien's legendarium
      #
      # @return [String]
      #
      # @example
      #   Faker::TolkienLegendarium.poem
      #     #=> "Chip the glasses and crack the plates"
      #
      # @faker.version next
      def poem
        fetch('tolkien_legendarium.poems')
      end
    end
  end
end
