# frozen_string_literal: true

require 'strings-ansi'
require 'unicode/display_width'

require_relative 'padder'

module Strings
  # Responsible for text padding
  module Pad
    NEWLINE = "\n".freeze

    SPACE = ' '.freeze

    # Apply padding to multiline text with ANSI codes
    #
    # @param [String] text
    #   the text to pad out
    # @param [Integer, Array[Integer]] padding
    #   the padding to apply to text
    #
    # @example
    #  text = "Ignorance is the parent of fear."
    #
    #  Strings::Pad.pad(text, [1, 2], fill: "*")
    #  # =>
    #  # "************************************\n"
    #  # "**Ignorance is the parent of fear.**\n"
    #  # "************************************\n"
    #
    # @return [String]
    #
    # @api private
    def pad(text, padding, fill: SPACE, separator: NEWLINE)
      padding   = Strings::Padder.parse(padding)
      text_copy = text.dup
      line_width = max_line_length(text, separator)
      output = []

      filler_line = fill * line_width

      padding.top.times do
        output << pad_around(filler_line, padding, fill: fill)
      end

      text_copy.split(separator).each do |line|
        output << pad_around(line, padding, fill: fill)
      end

      padding.bottom.times do
        output << pad_around(filler_line, padding, fill: fill)
      end

      output.join(separator)
    end
    module_function :pad

    # Apply padding to left and right side of string
    #
    # @param [String] text
    #
    # @return [String]
    #
    # @api private
    def pad_around(text, padding, fill: SPACE)
      fill * padding.left + text + fill * padding.right
    end
    module_function :pad_around

    # Determine maximum length for all multiline content
    #
    # @param [String] text
    # @param [String] separator
    #
    # @return [Integer]
    #
    # @api private
    def max_line_length(text, separator)
      lines = text.split(separator, -1)
      display_width(lines.max_by { |line| display_width(line) } || '')
    end
    module_function :max_line_length

    # Calculate visible string width
    #
    # @return [Integer]
    #
    # @api private
    def display_width(string)
      Unicode::DisplayWidth.of(Strings::ANSI.sanitize(string))
    end
    module_function :display_width
  end # Padding
end # Strings
