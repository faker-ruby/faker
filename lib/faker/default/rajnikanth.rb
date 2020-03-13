# frozen_string_literal: true

module Faker
  class Rajnikanth < Base
    flexible :rajnikanth

    class << self
      # Produces a Rajnikanth.
      # Original list of jokes:
      # http://www.rajinikanthjokes.com/
      #
      # @return [String]
      #
      # @example
      #   Faker::Rajnikanth.joke
      #     #=> "Rajinikanth is so fast that he always comes yesterday."
      #
      # @faker.version 2.10.3
      def joke
        fetch('rajnikanth.joke')
      end
    end
  end
end
