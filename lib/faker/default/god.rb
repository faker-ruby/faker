# frozen_string_literal: true
require 'faker\lib\locales\en\god.yml'

module Faker
  class God < Base
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
