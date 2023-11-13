# frozen_string_literal: true

module Faker
  class Show < Base
    class << self
      extend Gem::Deprecate
      ##
      # Produces the name of a musical for an older audience
      #
      # @return [String]
      #
      # @example
      #   Faker::Alphanumeric.alpha
      #     #=> "West Side Story"
      #
      # @faker.version 2.13.0
      def adult_musical
        fetch('theater.adult_musical')
      end

      deprecate :adult_musical, 'Faker::Theater.adult_musical', 2024, 02

      ##
      # Produces the name of a musical for a younger audience
      #
      # @return [String]
      #
      # @example
      #   Faker::Alphanumeric.alpha
      #     #=> "Into the Woods JR."
      #
      # @faker.version 2.13.0
      def kids_musical
        fetch('theater.kids_musical')
      end

      deprecate :kids_musical, 'Faker::Theater.kids_musical', 2024, 02

      ##
      # Produces the name of a play
      #
      # @return [String]
      #
      # @example
      #   Faker::Alphanumeric.alpha
      #     #=> "Death of a Salesman"
      #
      # @faker.version 2.13.0
      def play
        fetch('theater.play')
      end

      deprecate :play, 'Faker::Theater.play', 2024, 02
    end
  end
end
