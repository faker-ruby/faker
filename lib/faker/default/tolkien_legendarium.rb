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
      #   Faker::TolkienLegendarium.character #=> "Húrin"
      #
      # @faker.version next
      def character
        fetch('tolkien.characters')
      end

      ##
      # Produces a location from Tolkien's legendarium
      #
      # @return [String]
      #
      # @example
      #   Faker::TolkienLegendarium.location #=> "Helm's Deep"
      #
      # @faker.version next
      def location
        fetch('tolkien.locations')
      end

      ##
      # Produces a quote from Tolkien's legendarium
      #
      # @return [String]
      #
      # @example
      #   Faker::TolkienLegendarium.quote
      #     #=> "I wish the Ring had never come to me. I wish none of this had happened."
      #
      # @faker.version next
      def quote
        fetch('tolkien.quotes')
      end
    end
  end
end
