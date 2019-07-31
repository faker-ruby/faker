# frozen_string_literal: true

module Faker
  class Number < Base
    class << self
      def number(digits: 10)
        return if digits < 1
        return 0 if digits == 1

        # Ensure the first digit is not zero
        ([non_zero_digit] + generate(digits - 1)).join.to_i
      end

      def leading_zero_number(digits: 10)
        '0' + (2..digits).collect { digit }.join
      end

      def decimal_part(digits: 10)
        num = ''
        if digits > 1
          num = non_zero_digit
          digits -= 1
        end
        leading_zero_number(digits: digits) + num.to_s
      end

      def decimal(l_digits: 5, r_digits: 2)
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

      def hexadecimal(digits: 6)
        hex = ''
        digits.times { hex += rand(15).to_s(16) }
        hex
      end

      def normal(mean: 1, standard_deviation: 1)
        theta = 2 * Math::PI * rand
        rho = Math.sqrt(-2 * Math.log(1 - rand))
        scale = standard_deviation * rho
        mean + scale * Math.cos(theta)
      end

      def between(from: 1.00, to: 5000.00)
        Faker::Base.rand_in_range(from, to)
      end

      def within(range: 1.00..5000.00)
        between(from: range.min, to: range.max)
      end

      def positive(from: 1.00, to: 5000.00)
        random_number = between(from: from, to: to)

        greater_than_zero(random_number)
      end

      def negative(from: -5000.00, to: -1.00)
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
