# frozen_string_literal: true

module Strings
  module Fold
    LINE_BREAK = "(\r\n+|\r+|\n+|\t+)".freeze

    # Fold a multiline text into a single line string
    #
    # @example
    #   fold("\tfoo \r\n\n bar") # => "foo  bar"
    #
    # @param [String] text
    #
    # @param [String] separator
    #   the separators to be removed from the text, default: (\r\n+|\r+|\n+|\t+)
    #
    # @return [String]
    #
    # @api public
    def fold(text, separator = LINE_BREAK)
      text.gsub(/([ ]+)#{separator}/, "\\1")
          .gsub(/#{separator}(?<space>[ ]+)/, "\\k<space>")
          .gsub(/#{separator}/, ' ')
    end
    module_function :fold
  end # Fold
end # Strings
