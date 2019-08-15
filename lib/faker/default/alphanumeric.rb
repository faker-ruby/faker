# frozen_string_literal: true

module Faker
  class Alphanumeric < Base
    ALPHANUMS = LLetters + Numbers

    class << self
      def alpha(legacy_number = NOT_GIVEN, number: 32)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Alphanumeric.alpha` is deprecated. Use keyword argument like `Alphanumeric.alpha(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        char_count = resolve(number)
        return '' if char_count.to_i < 1

        Array.new(char_count) { sample(self::LLetters) }.join
      end

      ##
      # Produces a random string of alphanumeric characters
      #
      # @param [Integer] number
      # @param [Integer] min_alpha
      # @param [Integer] min_numeric
      #
      # @return [String]
      #
      # @example Faker::Alphanumeric.alphanumeric(number: 10) #=> "3yfq2phxtb"
      # @example Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3) #=> "3yfq2phxtb"
      # @example Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) #=> "3yfq2phx8b"
      #
      # @faker.version 2.1.3
      def alphanumeric(legacy_number = NOT_GIVEN, number: 32, min_alpha: 0, min_numeric: 0)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Alphanumeric.alphanumeric` is deprecated. Use keyword argument like `Alphanumeric.alphanumeric(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        char_count = resolve(number)
        return '' if char_count.to_i < 1
        raise ArgumentError, 'min_alpha must be greater than or equal to 0' if min_alpha&.negative?
        raise ArgumentError, 'min_numeric must be greater than or equal to 0' if min_numeric&.negative?

        if min_alpha.zero? && min_numeric.zero?
          return Array.new(char_count) { sample(ALPHANUMS) }.join
        end

        if min_alpha + min_numeric > char_count
          raise ArgumentError, 'min_alpha + min_numeric must be <= number'
        end

        random_count = char_count - min_alpha - min_numeric

        alphas = Array.new(min_alpha) { sample(self::LLetters) }
        numbers = Array.new(min_numeric) { sample(self::Numbers) }
        randoms = Array.new(random_count) { sample(ALPHANUMS) }

        combined = alphas + numbers + randoms
        combined.shuffle.join
      end
    end
  end
end
