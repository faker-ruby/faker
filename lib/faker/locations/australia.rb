# frozen_string_literal: true

module Faker
  class Australia < Base
    class << self
      ##
      # Produces a location in Australia
      #
      # @return [String]
      #
      # @example
      #   Faker::Australia.location
      #    #=> "Sydney"
      def location
        fetch('australia.locations')
      end
      # Produces an Australian animal
      #
      # @return [String]
      #
      # @example
      #   Faker::Australia.animal
      #    #=> "Dingo"

      def animal
        fetch('australia.animals')
      end
    end
  end
end
