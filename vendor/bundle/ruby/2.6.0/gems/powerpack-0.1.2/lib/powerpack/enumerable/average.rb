unless Enumerable.method_defined? :average
  module Enumerable
    # Calculates the average of a numeric collection.
    #
    # @param default [Object] an optional default return value if there are no elements.
    #   It's nil by default.
    # @return The average of the elements or the default value if there are no
    #   elements.
    #
    # @example
    #   [1, 2, 3].average #=> 2
    #   [1, 2, 3, 4].average #=> 2.5
    #   [].average #=> nil
    #   [].average(0) #=> 0
    def average(default = nil)
      coll_size = to_a.size
      coll_size > 0 ? reduce(&:+) / coll_size.to_f : default
    end
  end
end
