# frozen_string_literal: true

module Faker
  class Alphanumeric < Base
    class << self
      ALPHABET = ('a'..'z').to_a
      ALPHANUMS = ALPHABET + (0..9).to_a

      def alpha(legacy_number = NOT_GIVEN, number: 32)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Alphanumeric.alpha` is deprecated. Use keyword argument like `Alphanumeric.alpha(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end

        char_count = resolve(number)
        return '' if char_count.to_i < 1

        Array.new(char_count) { sample(ALPHABET) }.join
      end

      def alphanumeric(legacy_number = NOT_GIVEN, number: 32)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Alphanumeric.alphanumeric` is deprecated. Use keyword argument like `Alphanumeric.alphanumeric(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end

        char_count = resolve(number)
        return '' if char_count.to_i < 1

        Array.new(char_count) { sample(ALPHANUMS) }.join
      end
    end
  end
end
