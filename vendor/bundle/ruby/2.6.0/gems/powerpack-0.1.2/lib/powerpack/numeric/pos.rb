unless Numeric.method_defined? :pos?
  class Numeric
    # Checks whether a number is positive.
    #
    # @return [Boolean] true is the number is positive, false otherwise
    #
    # @example
    #   5.pos? #=> true
    #
    # @example
    #   -0.5.pos? #=> false
    #
    # @example
    #   0.pos? #=> false
    def pos?
      self > 0
    end
  end
end
