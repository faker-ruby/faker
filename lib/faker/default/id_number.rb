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
    BRAZILIAN_ID_FORMAT = /(\d{1,2})(\d{3})(\d{3})([\dX])/.freeze
    BRAZILIAN_ID_FROM = 10_000_000
    BRAZILIAN_ID_TO = 99_999_999

    CHILEAN_MODULO = 11

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
        num = Faker::Number.number(digits: 8)
        mod = num.to_i % 23
        check = CHECKS[mod]
        "#{num}-#{check}"
      end

      def spanish_foreign_citizen_number
        code = 'XYZ'
        digits = Faker::Number.number(digits: 7)
        prefix = code[rand(code.length)]
        prefix_val = 'XYZ'.index(prefix).to_s
        mod = "#{prefix_val}#{digits}".to_i % 23
        check = CHECKS[mod]
        "#{prefix}-#{digits}-#{check}"
      end

      def valid_south_african_id_number
        id_number = [
          Faker::Date.birthday.strftime('%y%m%d'),
          Faker::Number.number(digits: 4),
          ZA_CITIZENSHIP_DIGITS.sample(random: Faker::Config.random),
          ZA_RACE_DIGIT
        ].join

        [id_number, south_african_id_checksum_digit(id_number)].join
      end

      alias south_african_id_number valid_south_african_id_number

      def invalid_south_african_id_number
        invalid_date_of_birth = [
          Faker::Number.number(digits: 2),
          Faker::Number.between(from: 13, to: 99),
          Faker::Number.between(from: 32, to: 99)
        ].map(&:to_s).join

        id_number = [
          invalid_date_of_birth,
          Faker::Number.number(digits: 4),
          ZA_CITIZENSHIP_DIGITS.sample(random: Faker::Config.random),
          ZA_RACE_DIGIT
        ].join

        [id_number, south_african_id_checksum_digit(id_number)].join
      end

      def brazilian_citizen_number(legacy_formatted = NOT_GIVEN, formatted: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :formatted if legacy_formatted != NOT_GIVEN
        end

        digits = Faker::Number.leading_zero_number(digits: 9) until digits&.match(/(\d)((?!\1)\d)+/)
        first_digit = brazilian_citizen_number_checksum_digit(digits)
        second_digit = brazilian_citizen_number_checksum_digit(digits + first_digit)
        number = [digits, first_digit, second_digit].join
        formatted ? format('%s.%s.%s-%s', *number.scan(/\d{2,3}/).flatten) : number
      end

      alias brazilian_cpf brazilian_citizen_number

      def brazilian_id(legacy_formatted = NOT_GIVEN, formatted: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :formatted if legacy_formatted != NOT_GIVEN
        end

        digits = Faker::Number.between(to: BRAZILIAN_ID_FROM, from: BRAZILIAN_ID_TO).to_s
        check_digit = brazilian_id_checksum_digit(digits)
        number = [digits, check_digit].join
        formatted ? format('%s.%s.%s-%s', *number.scan(BRAZILIAN_ID_FORMAT).flatten) : number
      end

      alias brazilian_rg brazilian_id

      def chilean_id
        digits = Faker::Number.number(digits: 8)
        verification_code = chilean_verification_code(digits)

        digits.to_s + '-' + verification_code.to_s
      end

      private

      def chilean_verification_code(digits)
        # First digit is multiplied by 3, second by 2, and so on
        multiplication_rule = [3, 2, 7, 6, 5, 4, 3, 2]
        digits_splitted = digits.to_s.chars.map(&:to_i)

        sum = digits_splitted.map.with_index { |digit, index| digit * multiplication_rule[index] }.reduce(:+)

        modulo = sum.modulo(CHILEAN_MODULO)
        difference = CHILEAN_MODULO - modulo

        case difference
        when 0..9
          difference
        when 10
          'K'
        when 11
          0
        end
      end

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
        checksum = brazilian_document_checksum(digits)
        brazilian_document_digit(checksum)
      end

      def brazilian_id_checksum_digit(digits)
        checksum = brazilian_document_checksum(digits)
        brazilian_document_digit(checksum, id: true)
      end

      def brazilian_document_checksum(digits)
        digits.chars.each_with_index.inject(0) do |acc, (digit, i)|
          acc + digit.to_i * (digits.size + 1 - i)
        end * 10
      end

      def brazilian_document_digit(checksum, id = false)
        remainder = checksum % 11
        id ? brazilian_id_digit(remainder) : brazilian_citizen_number_digit(remainder)
      end

      def brazilian_citizen_number_digit(remainder)
        remainder == 10 ? '0' : remainder.to_s
      end

      def brazilian_id_digit(remainder)
        subtraction = 11 - remainder.to_i
        digits = { 10 => 'X', 11 => '0' }
        digits.include?(subtraction) ? digits[subtraction] : subtraction.to_s
      end

      def _translate(key)
        parse("id_number.#{key}")
      end
    end
  end
end
