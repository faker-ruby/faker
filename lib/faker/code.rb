module Faker
  class Code < Base
    class << self
      # By default generates 10 sign isbn code in format 123456789-X
      # You can pass 13 to generate new 13 sign code
      def isbn(base = 10)
        base == 13 ? generate_base13_isbn : generate_base10_isbn
      end

      def rut
        value = Number.number(8)
        vd = rut_verificator_digit(value)
        value << "-#{vd}"
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

      def rut_verificator_digit(rut)
        total = rut.to_s.rjust(8, '0').split(//).zip(%w(3 2 7 6 5 4 3 2)).collect{|a, b| a.to_i * b.to_i}.inject(:+)
        (11 - total % 11).to_s.gsub(/10/, 'k').gsub(/11/, '0')
      end
    end
  end
end
