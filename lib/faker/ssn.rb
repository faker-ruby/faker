module Faker
  class Ssn < Base
    class << self
      def swedish(hyphen: true, full_year: true)
        date = Date.birthday.to_s.gsub("-", "")
        serial = rand(999).to_s.rjust(3, "0")

        ssn = date + serial
        checksum = luhn_checksum(ssn[2..-1]).to_s

        ssn.insert(-4, "-") if hyphen
        ssn.slice!(0..1) unless full_year
        return ssn + checksum
      end

      private 

      def luhn_checksum(s)
        digits = s.split('').each_with_index.map { |n, i| n.to_i * (2 - i % 2) }
        sum = digits.inject(0) { |sum, digit| sum + digit.to_i }
        return (10 - sum % 10) % 10
      end

    end
  end
end
