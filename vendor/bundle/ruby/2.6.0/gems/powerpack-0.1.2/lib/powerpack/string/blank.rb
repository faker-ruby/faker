unless String.method_defined? :blank?
  class String
    # Checks whether a string is blank. A string is considered blank if it
    # is either empty or contains only whitespace characters.
    #
    # @return [Boolean] true is the string is blank, false otherwise
    #
    # @example
    #   ''.blank? #=> true
    #
    # @example
    #   '    '.blank? #=> true
    #
    # @example
    #   '  test'.blank? #=> false
    def blank?
      empty? || strip.empty?
    end
  end
end
