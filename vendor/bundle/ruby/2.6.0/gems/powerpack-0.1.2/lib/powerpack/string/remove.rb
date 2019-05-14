unless String.method_defined? :remove
  class String
    # Removes all occurrences of a pattern in a string.
    #
    # @return [String] a new string without any occurrences of the pattern.
    def remove(pattern)
      dup.remove!(pattern)
    end

    # Removes all occurrences of a pattern in a string.
    #
    # @return [String] the string without any occurrences of the pattern.
    def remove!(pattern)
      gsub!(pattern, '')
    end
  end
end
