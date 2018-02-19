module Faker
  class IDNumber < Base

    INVALID_SSN = [
        /0{3}-\d{2}-\d{4}/,
        /\d{3}-0{2}-\d{4}/,
        /\d{3}-\d{2}-0{4}/,
        /666-\d{2}-\d{4}/,
        /9\d{2}-\d{2}-\d{4}/
    ]

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
        checks = "TRWAGMYFPDXBNJZSQVHLCKE"
        num = Faker::Number.number(8)
        mod = num.to_i % 23
        check = checks[mod]
        "#{num}-#{check}"
      end

      def spanish_foreign_citizen_number
        checks = "TRWAGMYFPDXBNJZSQVHLCKE"
        code = "XY"
        "#{code[rand(code.length)]}-#{Faker::Number.number(7)}-#{checks[rand(checks.length)]}"
      end

      private

      def _translate(key)
        parse("id_number.#{key}")
      end
    end

  end
end
