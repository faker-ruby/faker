unless Array.method_defined? :butlast
  class Array
    # Returns a new array that has all the elements of the current but the last.
    #
    # @return [Array] a new array without the last element or an empty array if this
    #   array is empty
    #
    # @example
    #   [1, 2, 3].butlast #=> [1, 2]
    #   [].butlast #=> []
    def butlast
      self[0...-1]
    end
  end
end
