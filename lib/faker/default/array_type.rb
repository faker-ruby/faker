# frozen_string_literal: true

module Faker
  class ArrayType < Base
    class << self
      def integer(size: 3)
        raise ArgumentError, 'Size must be positive' if size.negative?
        return [] if size.zero?

        size.times.map { Faker::Types.rb_integer }
      end

      def random_size_integer
        integer(size: Faker::Types.rb_integer)
      end
    end
  end
end
