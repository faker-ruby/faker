# frozen_string_literal: true

module Faker
  class String < Base
    class << self
      def random(legacy_length = NOT_GIVEN, length: 32)
        if legacy_length != NOT_GIVEN
          warn_with_uplevel 'Passing `length` with the 1st argument of `String.random` is deprecated. Use keyword argument like `String.random(length: ...)` instead.', uplevel: 1
          length = legacy_length
        end

        utf8string select_a length
      end

      private

      def select_a(length)
        if length.class.included_modules.include? Enumerable
          select_a sample(length.to_enum.to_a)
        else
          length # recursive base case
        end
      end

      def utf8string(length)
        ratio = char_space_ratio
        (1..length.to_i).map do
          space_or_utf8_char ratio
        end.join
      end

      def space_or_utf8_char(ratio)
        sample [32.chr(Encoding::UTF_8), [utf8character] * ratio].flatten
      end

      def char_space_ratio
        sample [2, [3] * 5, [5] * 17, [7] * 11, 11, 191].flatten
      end

      def utf8character
        sample([
                 rand(32..90), # latin alphabet
                 rand(128),             # 7-bit ASCII
                 rand(0xd800),          # utf-8 codepoints below utf-16 surrogate halves
                 rand(57_344..1_114_111) # utf-8 codepoints above utf-16 surrogate halves
               ]).chr(Encoding::UTF_8)
      end
    end
  end
end
