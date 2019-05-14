unless Enumerable.method_defined? :take_last
  module Enumerable
    # Take the last n elements of an enumerable.
    #
    # @param n [Fixnum] the number of elements to take
    # @return [Array] an array containing the requested elements
    #
    # @example
    #   [1, 2, 3].take_last(2) #=> [2, 3]
    #   [].take_last(5) #=> []
    def take_last(n)
      fail ArgumentError, 'attempt to take negative size' if n < 0

      ary = to_a

      return ary if n > ary.size
      ary[(ary.size - n)..-1]
    end
  end
end
