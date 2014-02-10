module Faker
  class Number < Base
    class << self
      def number(digits)
        rand(10 ** digits).to_s.rjust(digits, '0')
      end

      def digit
        rand(9).to_s
      end
    end
  end
end
