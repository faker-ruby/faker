module Faker
  class NHS < Base
    class << self
      def nhs_number
        base_number = rand(400_000_000...499_999_999)
        "#{base_number}#{check_digit(base_number)}".to_s
                                                   .chars
                                                   .insert(3, ' ')
                                                   .insert(7, ' ')
                                                   .join('')
      end

      def check_digit(number)
        sum = 0
        number.to_s.chars.each_with_index do |digit, idx|
          position = idx + 1
          sum += (digit.to_i * (11 - position))
        end
        11 - (sum % 11)
      end
    end
  end
end
