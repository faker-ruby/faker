unless String.method_defined? :remove_prefix
  class String
    # Removes a prefix in a string.
    #
    # @return [String] a new string without the prefix.
    #
    # @example
    #   'Ladies Night'.remove_prefix('Ladies ') #=> 'Night'
    def remove_prefix(pattern)
      dup.remove_prefix!(pattern)
    end

    # Removes a prefix in a string.
    #
    # @return [String] the string without the prefix.
    #
    # @example
    #   'Ladies Night'.remove_prefix!('Ladies ') #=> 'Night'
    def remove_prefix!(pattern)
      gsub!(/\A#{pattern}/, '')
      self
    end
  end
end
