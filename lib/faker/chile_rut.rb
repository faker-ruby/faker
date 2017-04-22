module Faker
  class ChileRUT < Base
    class << self
      @@last_RUT = nil

      # Fixed param added for testing a specific RUT and check digit combination.
      def RUT(min_RUT = 1, fixed = false)
        @@last_RUT = fixed ? min_RUT : rand_in_range(min_RUT, 99_999_999)
      end

      def dv
        split_reversed_RUT = @@last_RUT.to_s.reverse.split('')
        seq = [2, 3, 4, 5, 6, 7]
        i = 0
        digit_sum = split_reversed_RUT.reduce(0) do |sum, n|
          partial_result = sum.to_i + (n.to_i * seq[i])
          i = i == 5 ? 0 : i + 1
          partial_result
        end
        partial_check_digit = 11 - (digit_sum % 11)
        if partial_check_digit == 11
          '0'
        elsif partial_check_digit == 10
          'k'
        else
          partial_check_digit.to_s
        end
      end

      # Alias for english speaking devs.
      def check_digit
        dv
      end

      def full_RUT(min_RUT = 0, fixed = false)
        "#{RUT(min_RUT, fixed)}-#{dv}"
      end

      def last_RUT
        @@last_RUT
      end
    end
  end
end
