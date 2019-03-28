# frozen_string_literal: true

module Faker
  class IDNumber < Base
    CHECKS = 'TRWAGMYFPDXBNJZSQVHLCKE'
    INVALID_SSN = [
      /0{3}-\d{2}-\d{4}/,
      /\d{3}-0{2}-\d{4}/,
      /\d{3}-\d{2}-0{4}/,
      /666-\d{2}-\d{4}/,
      /9\d{2}-\d{2}-\d{4}/
    ].freeze
    ZA_RACE_DIGIT = '8'
    ZA_CITIZENSHIP_DIGITS = %w[0 1].freeze

    class << self
      def valid
        _translate('valid')
      end

      def invalid
        _translate('invalid')
      end

      def ssn_valid
        ssn = regexify(/[0-8]\d{2}-\d{2}-\d{4}/)
        # We could still have all 0s in one segment or another
        INVALID_SSN.any? { |regex| regex =~ ssn } ? ssn_valid : ssn
      end

      def spanish_citizen_number
        num = Faker::Number.number(8)
        mod = num.to_i % 23
        check = CHECKS[mod]
        "#{num}-#{check}"
      end

      def spanish_foreign_citizen_number
        code = 'XYZ'
        digits = Faker::Number.number(7)
        prefix = code[rand(code.length)]
        prefix_val = 'XYZ'.index(prefix).to_s
        mod = "#{prefix_val}#{digits}".to_i % 23
        check = CHECKS[mod]
        "#{prefix}-#{digits}-#{check}"
      end

      def valid_south_african_id_number
        id_number = [
          Faker::Date.birthday.strftime('%y%m%d'),
          Faker::Number.number(4),
          ZA_CITIZENSHIP_DIGITS.sample(random: Faker::Config.random),
          ZA_RACE_DIGIT
        ].join

        [id_number, south_african_id_checksum_digit(id_number)].join
      end

      alias south_african_id_number valid_south_african_id_number

      def invalid_south_african_id_number
        invalid_date_of_birth = [
          Faker::Number.number(2),
          Faker::Number.between(13, 99),
          Faker::Number.between(32, 99)
        ].map(&:to_s).join

        id_number = [
          invalid_date_of_birth,
          Faker::Number.number(4),
          ZA_CITIZENSHIP_DIGITS.sample(random: Faker::Config.random),
          ZA_RACE_DIGIT
        ].join

        [id_number, south_african_id_checksum_digit(id_number)].join
      end

      def brazilian_citizen_number(formatted: false)
        digits = Faker::Number.leading_zero_number(9) until digits&.match(/(\d)((?!\1)\d)+/)
        first_digit = brazilian_citizen_number_checksum_digit(digits)
        second_digit = brazilian_citizen_number_checksum_digit(digits + first_digit)
        number = [digits, first_digit, second_digit].join
        formatted ? format('%s.%s.%s-%s', *number.scan(/\d{2,3}/).flatten) : number
      end

      private

      def south_african_id_checksum_digit(id_number)
        value_parts = id_number.chars
        even_digits = value_parts
                      .select
                      .with_index { |_, i| (i + 1).even? }
        odd_digits_without_last_character = value_parts[0...-1]
                                            .select
                                            .with_index { |_, i| (i + 1).odd? }

        sum_of_odd_digits = odd_digits_without_last_character.map(&:to_i).reduce(:+)
        even_digits_times_two = (even_digits.join('').to_i * 2).to_s
        sum_of_even_digits = even_digits_times_two.chars.map(&:to_i).reduce(:+)

        total_sum = sum_of_odd_digits + sum_of_even_digits

        ((10 - (total_sum % 10)) % 10).to_s
      end

      def brazilian_citizen_number_checksum_digit(digits)
        digit_sum = digits.chars.each_with_index.inject(0) do |acc, (digit, i)|
          acc + digit.to_i * (digits.size + 1 - i)
        end * 10
        remainder = digit_sum % 11
        remainder == 10 ? '0' : remainder.to_s
      end

      def _translate(key)
        parse("id_number.#{key}")
      end
    end
  end
end
