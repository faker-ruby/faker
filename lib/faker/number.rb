module Faker
  class Number < Base
    class << self
      def number(digits)
        (1..digits).collect {digit}.join
      end

      def digit
        (rand() * 9).round.to_s
      end
    end
  end
end
