# frozen_string_literal: true
module Faker
  class String
    class << self
      def random(length= 32)
        utf8string select_a length
      end

    private

      def select_a length
        if length.class.included_modules.include? Enumerable
          select_a length.to_enum.to_a.sample(:random => Faker::Config.random)
        else
          length # recursive base case
        end
      end

      def utf8string(length)
        ratio= char_space_ratio
        (1..length.to_i).map do
          space_or_utf8_char ratio
        end.join
      end

      def space_or_utf8_char ratio
        [
          32.chr(Encoding::UTF_8), [utf8character]* ratio
        ].flatten.sample(:random => Faker::Config.random)
      end

      def char_space_ratio
        [
          2, [3]*5, [5]*17, [7]*11, 11, 191,
        ].flatten.sample(:random => Faker::Config.random)
      end

      def utf8character
        [
          Faker::Config.random.rand(59)+ 32,          # latin alphabet
          Faker::Config.random.rand(128),             # 7-bit ASCII
          Faker::Config.random.rand(0xd800),          # utf-8 codepoints below utf-16 surrogate halves
          Faker::Config.random.rand(0x102000)+ 0xe000 # utf-8 codepoints above utf-16 surrogate halves
        ].sample(:random => Faker::Config.random).chr(Encoding::UTF_8)
      end
    end
  end
end
