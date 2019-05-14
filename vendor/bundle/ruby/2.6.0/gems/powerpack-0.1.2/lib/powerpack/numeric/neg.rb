unless Numeric.method_defined? :neg?
  class Numeric
    # Checks whether a number is negative.
    #
    # @return [Boolean] true is the number is negative, false otherwise
    #
    # @example
    #   5.neg? #=> false
    #
    # @example
    #   -0.5.neg? #=> true
    #
    # @example
    #   0.neg? #=> false
    def neg?
      self < 0
    end
  end
end
