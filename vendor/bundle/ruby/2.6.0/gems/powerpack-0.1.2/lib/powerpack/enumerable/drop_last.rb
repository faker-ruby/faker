unless Enumerable.method_defined? :drop_last
  module Enumerable
    # Drops the last n elements of an enumerable.
    #
    # @param n [Fixnum] the number of elements to drop
    # @return [Array] an array containing the remaining elements
    #
    # @example
    #   [1, 2, 3].drop_last(1) #=> [1, 2]
    #   [].drop_last(5) #=> []
    def drop_last(n)
      fail ArgumentError, 'attempt to drop negative size' if n < 0

      ary = to_a

      return [] if n > ary.size
      ary[0...(ary.size - n)]
    end
  end
end
