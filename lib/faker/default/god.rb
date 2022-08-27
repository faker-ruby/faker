# frozen_string_literal: true


module Faker
  class God < Base

    flexible :god

    class << self
      ##
      # Produces a god name.
      #
      # @return [String]
      #
      # @example
      #   Faker::God.name #=> "Zeus"
      #
      # @faker.version 1.4.3
      def name
        fetch('god.name')
      end

      def type
        fetch('god.type')
      end
    end
  end
end
