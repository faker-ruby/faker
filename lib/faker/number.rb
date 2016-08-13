module Faker
  class Number < Base
    class << self
      def number(digits)
        num = ''
        if digits > 1
          num = non_zero_digit
          digits -= 1
        end
        num + leading_zero_number(digits)
      end

      def leading_zero_number(digits)
        (1..digits).collect {digit}.join
      end

      def decimal_part digits
        num = ''
        if digits > 1
          num = non_zero_digit
          digits -= 1
        end
        leading_zero_number(digits) + num
      end

      def decimal(l_digits, r_digits = 2)
        l_d = self.number(l_digits)
        r_d = self.decimal_part(r_digits)
        "#{l_d}.#{r_d}"
      end

      def non_zero_digit
        ( rand(9) + 1 ).to_s
      end

      def digit
        rand(10).to_s
      end

      def hexadecimal(digits)
        hex = ""
        digits.times { hex += rand(15).to_s(16) }
        hex
      end

      def between(from = 1.00, to = 5000.00)
        Faker::Base::rand_in_range(from, to)
      end

      def positive(from = 1.00, to = 5000.00)
        random_number = between(from, to)
        greater_than_zero(random_number)
      end

      def negative(from = -5000.00, to = -1.00)
        random_number = between(from, to)
        less_than_zero(random_number)
      end

      private

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
