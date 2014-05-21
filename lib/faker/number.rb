module Faker
  class Number < Base
    class << self
      def number(digits)
        Faker::Config.random.rand(10 ** digits).to_s.rjust(digits, '0')
      end

      def decimal(l_digits, r_digits = 2)
        l_d = self.number(l_digits)
        r_d = self.number(r_digits)
        "#{l_d}.#{r_d}"
      end

      def digit
        Faker::Config.random.rand(9).to_s
      end
    end
  end
end
