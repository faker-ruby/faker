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
      #   Faker::Fantasy::Australia.location
      #    #=> "Sydney"
      #
      # @faker.version next
      def location
        fetch('australia.locations')
      end
    end
  end
end
