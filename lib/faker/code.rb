module Faker
  class Code < Base
    class << self
      # By default generates 10 sign isbn code in format 123456789-X
      # You can pass 13 to generate new 13 sign code
      def isbn(base = 10)
        base == 13 ? generate_base13_isbn : generate_base10_isbn
      end

      # By default generates 13 sign ean code in format 1234567890123
      # You can pass 8 to generate ean8 code
      def ean(base = 13)
        base == 8 ? generate_base8_ean : generate_base13_ean
      end

    private

      def generate_base10_isbn
        values = regexify(/\d{9}/)
        remainder = sum(values) { |value, index| (index + 1) * value.to_i } % 11
        values << "-#{remainder == 10 ? 'X' : remainder}"
      end

      def generate_base13_isbn
        values = regexify(/\d{12}/)
        remainder = sum(values) { |value, index| index.even? ? value.to_i : value.to_i * 3 } % 10
        values << "-#{((10 - remainder) % 10)}"
      end

      def sum(values, &block)
        values.split(//).each_with_index.inject(0) do |sum, (value, index)|
          sum + block.call(value, index)
        end
      end

      def generate_base8_ean
        values = regexify(/\d{7}/)
        check_digit = values.split(//).each_with_index.inject(0){ |s, (v, i)| s + v.to_i * EAN_CHECK_DIGIT8[i] } % 10
        values << (10 - check_digit).to_s
      end

      def generate_base13_ean
        values = regexify(/\d{12}/)
        check_digit = values.split(//).each_with_index.inject(0){ |s, (v, i)| s + v.to_i * EAN_CHECK_DIGIT13[i] } % 10
        values << (10 - check_digit).to_s
      end

      EAN_CHECK_DIGIT8 = [3, 1, 3, 1, 3, 1, 3, 1]
      EAN_CHECK_DIGIT13 = [1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1]
    end
  end
end
