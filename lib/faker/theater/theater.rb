# frozen_string_literal: true

module Faker
  class Theater < Base
    class << self
      ##
      # Produces the name of a musical for an older audience
      #
      # @return [String]
      #
      # @example
      #   Faker::Theater.adult_musical
      #     #=> "West Side Story"
      #
      # @faker.version next
      def adult_musical
        fetch('theater.adult_musical')
      end

      ##
      # Produces the name of a musical for a younger audience
      #
      # @return [String]
      #
      # @example
      #   Faker::Theater.kids_musical
      #     #=> "Into the Woods JR."
      #
      # @faker.version next
      def kids_musical
        fetch('theater.kids_musical')
      end

      ##
      # Produces the name of a play
      #
      # @return [String]
      #
      # @example
      #   Faker::Theater.play
      #     #=> "Death of a Salesman"
      #
      # @faker.version next
      def play
        fetch('theater.play')
      end
    end
  end
end
