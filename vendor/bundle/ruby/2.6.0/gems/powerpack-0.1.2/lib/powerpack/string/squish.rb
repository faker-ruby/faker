unless String.method_defined? :squish
  class String
    # Strips leading and trailing whitespace and squashes internal whitespace.
    #
    # @return [String] a new string with no leading and trailing
    #   whitespace and no consecutive whitespace characters inside it
    #
    # @example
    #   ' Peter   Parker'.squish #=> 'Peter Parker'
    def squish
      dup.squish!
    end

    # Strips leading and trailing whitespace and squashes internal whitespace.
    #
    # @return [String] the string with no leading and trailing whitespace and no
    #   consecutive whitespace characters inside it
    #
    # @example
    #   ' Peter   Parker'.squish #=> 'Peter Parker'
    def squish!
      strip!
      gsub!(/\s+/, ' ')
      self
    end
  end
end
