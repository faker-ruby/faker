# encoding: utf-8

class String
  # Return a copy of string with ASCII characters only
  # Source: http://stackoverflow.com/questions/1268289/how-to-get-rid-of-non-ascii-characters-in-ruby
  #
  # @return [String] a copy of string with ASCII characters only
  #
  # @example
  #   'abc'.ascii_only #=> 'abc'
  #
  # @example
  #   '中文123'.ascii_only #=> '123'
  unless String.method_defined? :ascii_only
    def ascii_only
      dup.ascii_only!
    end
  end

  # Modify self and keep ASCII characters only
  # Returns the string even if no changes were made.
  # Source: http://stackoverflow.com/questions/1268289/how-to-get-rid-of-non-ascii-characters-in-ruby
  #
  # @return [String] The result string
  #
  # @example
  #   'abc'.ascii_only! #=> 'abc'
  #
  # @example
  #   '中文123'.ascii_only! #=> '123'
  unless String.method_defined? :ascii_only!
    def ascii_only!
      encoding_options = {
        :invalid                     => :replace,  # Replace invalid byte sequences
        :undef                       => :replace,  # Replace anything not defined in ASCII
        :replace                     => '',        # Use a blank for those replacements
        :UNIVERSAL_NEWLINE_DECORATOR => true       # Always break lines with \n
      }
      self.encode! Encoding.find('ASCII'), encoding_options
    end
  end
end
