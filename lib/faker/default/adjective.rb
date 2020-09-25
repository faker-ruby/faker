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
      # @faker.version x.x.x
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
      # @faker.version x.x.x
      def bad
        fetch('adjective.bad')
      end
    end
  end
end
