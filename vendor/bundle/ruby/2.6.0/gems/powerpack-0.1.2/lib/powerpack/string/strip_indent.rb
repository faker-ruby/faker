unless String.method_defined? :strip_indent
  class String
    # The method strips the whitespace preceding the base indentation.
    # Useful for HEREDOCs and other multi-line strings.
    #
    # @example
    #
    #   code = <<-END.strip_indent
    #     def test
    #       some_method
    #       other_method
    #     end
    #   END
    #
    #   #=> "def\n  some_method\n  \nother_method\nend"
    def strip_indent
      leading_space = scan(/^[ \t]*(?=\S)/).min
      indent = leading_space ? leading_space.size : 0
      gsub(/^[ \t]{#{indent}}/, '')
    end
  end
end
