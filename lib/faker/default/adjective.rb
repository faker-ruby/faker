# frozen_string_literal: true

module Faker
  class Adjective < Base
    flexible :adjective

    class << self
      ##
      # Produces a nice adjective.
      #
      # @return [String]
      #
      # @example
      #   Faker::Adjective.nice #=> "Kind"
      #
      # @faker.version 1.6.5
      def nice
        fetch('adjective.nice')
      end

      ##
      # Produces a bad adjective.
      #
      # @return [String]
      #
      # @example
      #   Faker::Adjective.bad #=> "Creepy"
      #
      # @faker.version 1.6.5
      def bad
        fetch('adjective.bad')
      end
    end
  end
end
