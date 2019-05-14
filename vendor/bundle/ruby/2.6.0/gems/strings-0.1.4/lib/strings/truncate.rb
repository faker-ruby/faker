# frozen_string_literal: true

require 'strings-ansi'
require 'unicode/display_width'
require 'unicode_utils/each_grapheme'

module Strings
  # A module responsible for text truncation
  module Truncate
    DEFAULT_TRAILING = '…'.freeze

    DEFAULT_LENGTH = 30

    # Truncate a text at a given length (defualts to 30)
    #
    # @param [String] text
    #   the text to be truncated
    #
    # @param [Integer] truncate_at
    #   the width at which to truncate the text
    #
    # @param [Hash] options
    #   @option options [Symbol] :separator the character for splitting words
    #   @option options [Symbol] :trailing  the character for ending sentence
    #
    # @example
    #   text = "The sovereignest thing on earth is parmacetti for an inward bruise."
    #
    #   Strings::Truncate.truncate(text)
    #   # => "The sovereignest thing on ear…"
    #
    #   Strings::Truncate.truncate(text, 20)
    #   # => "The sovereignest th…"
    #
    #   Strings::Truncate.truncate(text, 20, separator: ' ' )
    #   # => "The sovereignest…"
    #
    #   Strings::Truncate.truncate(40, trailing: '... (see more)' )
    #   # => "The sovereignest thing on... (see more)"
    #
    # @api public
    def truncate(text, truncate_at = DEFAULT_LENGTH, options = {})
      if truncate_at.is_a?(Hash)
        options = truncate_at
        truncate_at = DEFAULT_LENGTH
      end

      if display_width(text) <= truncate_at.to_i || truncate_at.to_i.zero?
        return text.dup
      end

      trail      = options.fetch(:trailing) { DEFAULT_TRAILING }
      separation = options.fetch(:separator) { nil }
      sanitized_text = Strings::ANSI.sanitize(text)

      length_without_trailing = truncate_at - display_width(trail)
      chars = to_chars(sanitized_text).to_a
      stop  = chars[0, length_without_trailing].rindex(separation)
      slice_length = stop || length_without_trailing
      sliced_chars = chars[0, slice_length]
      original_chars = to_chars(text).to_a[0, 3 * slice_length]
      shorten(original_chars, sliced_chars, length_without_trailing).join + trail
    end
    module_function :truncate

    # Perform actual shortening of the text
    #
    # @return [String]
    #
    # @api private
    def shorten(original_chars, chars, length_without_trailing)
      truncated = []
      char_width = display_width(chars[0])
      while length_without_trailing - char_width > 0
        orig_char = original_chars.shift
        char = chars.shift
        break unless char
        while orig_char != char # consume ansi
          ansi = true
          truncated << orig_char
          orig_char = original_chars.shift
        end
        truncated << char
        char_width = display_width(char)
        length_without_trailing -= char_width
      end
      truncated << ["\e[0m"] if ansi
      truncated
    end
    module_function :shorten

    # @api private
    def to_chars(text)
      UnicodeUtils.each_grapheme(text)
    end
    module_function :to_chars

    # Visible width of a string
    #
    # @api private
    def display_width(string)
      Unicode::DisplayWidth.of(Strings::ANSI.sanitize(string))
    end
    module_function :display_width
  end # Truncate
end # Strings
