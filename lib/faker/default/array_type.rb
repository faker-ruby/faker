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
      def integer(size: 3)
        raise ArgumentError, 'Size must be positive' if size.negative?
        return [] if size.zero?

        size.times.map { Faker::Types.rb_integer }
      end

      ##
      # Produces an array of integers of random size.
      #
      # @return [Array]
      #
      # @example
      #   > Faker::ArrayType.random_size_integer #=> [98, 3, 54, 18, 22, 33, 7, 99, 1, 7]
      def random_size_integer
        integer(size: Faker::Types.rb_integer)
      end
    end
  end
end
