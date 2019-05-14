unless Array.method_defined? :butfirst
  class Array
    # Returns a new array rejecting the current one's first element.
    #
    # @return [Array] a new array without the first element or nil if this
    #   array is empty
    #
    # @example
    #   [1, 2, 3].butfirst #=> [2, 3]
    #   [].butfirst #=> nil
    def butfirst
      self[1..-1]
    end
  end
end
