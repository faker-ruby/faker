# frozen_string_literal: true

module Faker
  class TolkienLegendarium < Base
    flexible :tolkien

    class LordOfTheRings; end
    LordOfTheRings = Movies::LordOfTheRings
    class Hobbit; end
    Hobbit = Movies::Hobbit

    class << self
      ##
      # Produces a character from Tolkien's legendarium
      #
      # @return [String]
      #
      # @example
      #   Faker::TolkienLegendarium.character #=> "Hurin"
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
      #   Faker::TolkienLegendarium.location #=> "Helm's Deep"
      #
      # @faker.version next
      def location
        fetch('tolkien_legendarium.locations')
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
        fetch('tolkien_legendarium.quotes')
      end
    end
  end
end
