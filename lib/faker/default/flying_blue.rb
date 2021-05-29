# frozen_string_literal: true

module Faker
  class FlyingBlue < Base
    class << self
      def account_number
        number = rand.to_s[2..10]
        check_digit = (number.to_i % 7) - 1
        check_digit = 6 if check_digit.negative?
        "#{number}#{check_digit}"
      end
    end
  end
end
