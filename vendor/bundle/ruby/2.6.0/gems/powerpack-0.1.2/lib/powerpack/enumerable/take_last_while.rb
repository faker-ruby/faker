unless Enumerable.method_defined? :take_last_while?
  module Enumerable
    # Take the last n elements of an enumerable meeting a certain predicate.
    #
    # @return [Array] an array containing the matching elements
    #
    # @example
    #   [1, 2, 3, 5].take_last_while(&:odd?) #=> [3, 5]
    def take_last_while
      return to_enum(:take_last_while) unless block_given?

      result = []
      reverse_each { |elem| yield(elem) ? result.unshift(elem) : break  }
      result
    end
  end
end
