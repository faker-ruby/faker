# frozen_string_literal: true

module Faker
  class Number < Base
    class << self
      def number(legacy_digits = NOT_GIVEN, digits: 10)
        warn_for_deprecated_arguments do |keywords|
          keywords << :digits if legacy_digits != NOT_GIVEN
        end

        return if digits < 1
        return rand(0..9).round if digits == 1

        # Ensure the first digit is not zero
        ([non_zero_digit] + generate(digits - 1)).join.to_i
      end

      def leading_zero_number(legacy_digits = NOT_GIVEN, digits: 10)
        warn_for_deprecated_arguments do |keywords|
          keywords << :digits if legacy_digits != NOT_GIVEN
        end

        '0' + (2..digits).collect { digit }.join
      end

      def decimal_part(legacy_digits = NOT_GIVEN, digits: 10)
        warn_for_deprecated_arguments do |keywords|
          keywords << :digits if legacy_digits != NOT_GIVEN
        end

        num = ''
        if digits > 1
          num = non_zero_digit
          digits -= 1
        end
        leading_zero_number(digits: digits) + num.to_s
      end

      def decimal(legacy_l_digits = NOT_GIVEN, legacy_r_digits = NOT_GIVEN, l_digits: 5, r_digits: 2)
        warn_for_deprecated_arguments do |keywords|
          keywords << :l_digits if legacy_l_digits != NOT_GIVEN
          keywords << :r_digits if legacy_r_digits != NOT_GIVEN
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
        warn_for_deprecated_arguments do |keywords|
          keywords << :digits if legacy_digits != NOT_GIVEN
        end

        hex = ''
        digits.times { hex += rand(15).to_s(16) }
        hex
      end

      def normal(legacy_mean = NOT_GIVEN, legacy_standard_deviation = NOT_GIVEN, mean: 1, standard_deviation: 1)
        warn_for_deprecated_arguments do |keywords|
          keywords << :mean if legacy_mean != NOT_GIVEN
          keywords << :standard_deviation if legacy_standard_deviation != NOT_GIVEN
        end

        theta = 2 * Math::PI * rand
        rho = Math.sqrt(-2 * Math.log(1 - rand))
        scale = standard_deviation * rho
        mean + scale * Math.cos(theta)
      end

      def between(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: 1.00, to: 5000.00)
        warn_for_deprecated_arguments do |keywords|
          keywords << :from if legacy_from != NOT_GIVEN
          keywords << :to if legacy_to != NOT_GIVEN
        end

        Faker::Base.rand_in_range(from, to)
      end

      def within(legacy_range = NOT_GIVEN, range: 1.00..5000.00)
        warn_for_deprecated_arguments do |keywords|
          keywords << :range if legacy_range != NOT_GIVEN
        end

        between(from: range.min, to: range.max)
      end

      def positive(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: 1.00, to: 5000.00)
        warn_for_deprecated_arguments do |keywords|
          keywords << :from if legacy_from != NOT_GIVEN
          keywords << :to if legacy_to != NOT_GIVEN
        end

        random_number = between(from: from, to: to)

        greater_than_zero(random_number)
      end

      def negative(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: -5000.00, to: -1.00)
        warn_for_deprecated_arguments do |keywords|
          keywords << :from if legacy_from != NOT_GIVEN
          keywords << :to if legacy_to != NOT_GIVEN
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
