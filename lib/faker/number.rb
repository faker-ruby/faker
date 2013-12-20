module Faker
  class Number < Base
    class << self
      def number(digits)
        rand(digits ** 10 - 1).to_s.center(digits, rand(9).to_s)
      end

      def digit
        rand(9).to_s
      end

      def money(options = {})
        from = (options[:from] || 0.01) * 100
        to = (options[:to] || 1000) * 100

        (rand(from - to) + from) / 100
      end
    end
  end
end
