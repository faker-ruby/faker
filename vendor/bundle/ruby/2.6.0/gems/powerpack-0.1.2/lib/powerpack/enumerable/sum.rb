unless Enumerable.method_defined? :sum
  module Enumerable
    # Sums up elements of a collection by invoking their `+` method.
    # Most useful for summing up numbers.
    #
    # @param initial [Object] an optional initial value.
    #   It defaults to 0 for an empty collection.
    # @return The sum of the elements, or the initial value if there
    #   are no elements.
    #
    # @example
    #   [1, 2, 3].sum #=> 6
    #   [[1], [2], [3]].sum #=> [1, 2, 3]
    #   [].sum #=> 0
    #   ["a"].sum #=> "a"
    #   ["b", "c"].sum("a") #=> "abc"
    def sum(initial = nil)
      if initial
        reduce(initial, &:+)
      else
        reduce(&:+) || 0
      end
    end
  end
end
