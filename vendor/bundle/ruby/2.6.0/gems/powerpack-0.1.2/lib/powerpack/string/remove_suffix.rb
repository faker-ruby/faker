unless String.method_defined? :remove_suffix
  class String
    # Removes a suffix in a string.
    #
    # @return [String] a new string without the suffix.
    #
    # @example
    #   'Ladies Night'.remove_suffix(' Night') #=> 'Ladies'
    def remove_suffix(pattern)
      dup.remove_suffix!(pattern)
    end

    # Removes a suffix in a string.
    #
    # @return [String] the string without the suffix.
    #
    # @example
    #   'Ladies Night'.remove_suffix!(' Night') #=> 'Ladies'
    def remove_suffix!(pattern)
      gsub!(/#{pattern}\z/, '')
      self
    end
  end
end
