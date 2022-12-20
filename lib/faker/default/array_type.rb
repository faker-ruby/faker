# frozen_string_literal: true

module Faker
  class ArrayType < Base
    class << self
      ##
      # Produces an array of integers of given size.
      #
      # @param size [Integer]
      # @return [Array]
      #
      # @example
      #   > Faker::ArrayType.integer #=> [99, 3, 19]
      def integer(size: Faker::Types.rb_integer)
        raise ArgumentError, 'Size must be positive' if size.negative?
        return [] if size.zero?

        size.times.map { Faker::Types.rb_integer }
      end
    end
  end
end
