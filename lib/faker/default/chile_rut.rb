# frozen_string_literal: true

module Faker
  class ChileRut < Base
    class << self
      @last_rut = nil

      # Fixed param added for testing a specific RUT and check digit combination.
      def rut(min_rut: 1, fixed: false)
        @last_rut = fixed ? min_rut : rand_in_range(min_rut, 99_999_999)
      end

      def dv
        split_reversed_rut = @last_rut.to_s.reverse.split('')
        seq = [2, 3, 4, 5, 6, 7]
        i = 0
        digit_sum = split_reversed_rut.reduce(0) do |sum, n|
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

      def full_rut(min_rut: 0, fixed: false)
        "#{rut(min_rut: min_rut, fixed: fixed)}-#{dv}"
      end

      attr_reader :last_rut
    end
  end
end
