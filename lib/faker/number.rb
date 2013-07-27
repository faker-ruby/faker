module Faker
  class Number < Base
    class << self
      def number(digits)
        rand(digits ** 10 - 1).to_s.center(digits, rand(9).to_s)
      end

      def digit
        rand(9).to_s
      end
    end
  end
end
