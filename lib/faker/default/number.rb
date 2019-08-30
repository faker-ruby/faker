# frozen_string_literal: true

module Faker
  class Number < Base
    class << self
      def number(legacy_digits = NOT_GIVEN, digits: 10)
        if legacy_digits != NOT_GIVEN
          warn_with_uplevel 'Passing `digits` with the 1st argument of `Number.number` is deprecated. Use keyword argument like `Number.number(digits: ...)` instead.', uplevel: 1
          digits = legacy_digits
        end

        return if digits < 1
        return rand(0..9).round if digits == 1

        # Ensure the first digit is not zero
        ([non_zero_digit] + generate(digits - 1)).join.to_i
      end

      def leading_zero_number(legacy_digits = NOT_GIVEN, digits: 10)
        if legacy_digits != NOT_GIVEN
          warn_with_uplevel 'Passing `digits` with the 1st argument of `Number.leading_zero_number` is deprecated. Use keyword argument like `Number.leading_zero_number(digits: ...)` instead.', uplevel: 1
          digits = legacy_digits
        end

        '0' + (2..digits).collect { digit }.join
      end

      def decimal_part(legacy_digits = NOT_GIVEN, digits: 10)
        if legacy_digits != NOT_GIVEN
          warn_with_uplevel 'Passing `digits` with the 1st argument of `Number.decimal_part` is deprecated. Use keyword argument like `Number.decimal_part(digits: ...)` instead.', uplevel: 1
          digits = legacy_digits
        end

        num = ''
        if digits > 1
          num = non_zero_digit
          digits -= 1
        end
        leading_zero_number(digits: digits) + num.to_s
      end

      def decimal(legacy_l_digits = NOT_GIVEN, legacy_r_digits = NOT_GIVEN, l_digits: 5, r_digits: 2)
        if legacy_l_digits != NOT_GIVEN
          warn_with_uplevel 'Passing `l_digits` with the 1st argument of `Number.decimal` is deprecated. Use keyword argument like `Number.decimal(l_digits: ...)` instead.', uplevel: 1
          l_digits = legacy_l_digits
        end
        if legacy_r_digits != NOT_GIVEN
          warn_with_uplevel 'Passing `r_digits` with the 2nd argument of `Number.decimal` is deprecated. Use keyword argument like `Number.decimal(r_digits: ...)` instead.', uplevel: 1
          r_digits = legacy_r_digits
        end

        l_d = number(digits: l_digits)
        r_d = if r_digits == 1
                generate(r_digits)
              else
                # Ensure the last digit is not zero
                # so it does not get truncated on converting to float
                generate(r_digits - 1).join + non_zero_digit.to_s
              end
        "#{l_d}.#{r_d}".to_f
      end

      def non_zero_digit
        rand(1..9)
      end

      def digit
        rand(10)
      end

      def hexadecimal(legacy_digits = NOT_GIVEN, digits: 6)
        if legacy_digits != NOT_GIVEN
          warn_with_uplevel 'Passing `digits` with the 1st argument of `Number.hexadecimal` is deprecated. Use keyword argument like `Number.hexadecimal(digits: ...)` instead.', uplevel: 1
          digits = legacy_digits
        end

        hex = ''
        digits.times { hex += rand(15).to_s(16) }
        hex
      end

      def normal(legacy_mean = NOT_GIVEN, legacy_standard_deviation = NOT_GIVEN, mean: 1, standard_deviation: 1)
        if legacy_mean != NOT_GIVEN
          warn_with_uplevel 'Passing `mean` with the 1st argument of `Number.normal` is deprecated. Use keyword argument like `Number.normal(mean: ...)` instead.', uplevel: 1
          mean = legacy_mean
        end
        if legacy_standard_deviation != NOT_GIVEN
          warn_with_uplevel 'Passing `standard_deviation` with the 2nd argument of `Number.normal` is deprecated. Use keyword argument like `Number.normal(standard_deviation: ...)` instead.', uplevel: 1
          standard_deviation = legacy_standard_deviation
        end

        theta = 2 * Math::PI * rand
        rho = Math.sqrt(-2 * Math.log(1 - rand))
        scale = standard_deviation * rho
        mean + scale * Math.cos(theta)
      end

      def between(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: 1.00, to: 5000.00)
        if legacy_from != NOT_GIVEN
          warn_with_uplevel 'Passing `from` with the 1st argument of `Number.between` is deprecated. Use keyword argument like `Number.between(from: ...)` instead.', uplevel: 1
          from = legacy_from
        end
        if legacy_to != NOT_GIVEN
          warn_with_uplevel 'Passing `to` with the 2nd argument of `Number.between` is deprecated. Use keyword argument like `Number.between(to: ...)` instead.', uplevel: 1
          to = legacy_to
        end

        Faker::Base.rand_in_range(from, to)
      end

      def within(legacy_range = NOT_GIVEN, range: 1.00..5000.00)
        if legacy_range != NOT_GIVEN
          warn_with_uplevel 'Passing `range` with the 1st argument of `Number.within` is deprecated. Use keyword argument like `Number.within(range: ...)` instead.', uplevel: 1
          range = legacy_range
        end

        between(from: range.min, to: range.max)
      end

      def positive(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: 1.00, to: 5000.00)
        if legacy_from != NOT_GIVEN
          warn_with_uplevel 'Passing `from` with the 1st argument of `Number.positive` is deprecated. Use keyword argument like `Number.positive(from: ...)` instead.', uplevel: 1
          from = legacy_from
        end
        if legacy_to != NOT_GIVEN
          warn_with_uplevel 'Passing `to` with the 2nd argument of `Number.positive` is deprecated. Use keyword argument like `Number.positive(to: ...)` instead.', uplevel: 1
          to = legacy_to
        end

        random_number = between(from: from, to: to)

        greater_than_zero(random_number)
      end

      def negative(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: -5000.00, to: -1.00)
        if legacy_from != NOT_GIVEN
          warn_with_uplevel 'Passing `from` with the 1st argument of `Number.negative` is deprecated. Use keyword argument like `Number.negative(from: ...)` instead.', uplevel: 1
          from = legacy_from
        end
        if legacy_to != NOT_GIVEN
          warn_with_uplevel 'Passing `to` with the 2nd argument of `Number.negative` is deprecated. Use keyword argument like `Number.negative(to: ...)` instead.', uplevel: 1
          to = legacy_to
        end

        random_number = between(from: from, to: to)

        less_than_zero(random_number)
      end

      private

      def generate(count)
        return [] if count.zero?

        Array.new(count) { digit }
      end

      def greater_than_zero(number)
        should_be(number, :>)
      end

      def less_than_zero(number)
        should_be(number, :<)
      end

      def should_be(number, method_to_compare)
        if number.send(method_to_compare, 0)
          number
        else
          number * -1
        end
      end
    end
  end
end
